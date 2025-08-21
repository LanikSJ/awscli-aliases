#!/usr/bin/env bash

# Load shunit2
# You might need to download shunit2 and place it in a known location,
# or adjust this path to where shunit2 is accessible.
# For example, if shunit2 is in /usr/local/bin/shunit2, use that path.
# For this example, we'll assume it's in the same directory or sourced.
# A common way is to download it and source it:
# curl -sSL https://raw.githubusercontent.com/kward/shunit2/master/shunit2 > shunit2
# . "$(dirname "$0")/shunit2"

# Mock commands
mock_uname() {
  echo "$MOCKED_UNAME"
}

mock_which() {
  if [[ "$1" == "brew" && "$MOCKED_BREW_EXISTS" == "true" ]]; then
    echo "/usr/local/bin/brew"
    return 0
  elif [[ "$1" == "brew" && "$MOCKED_BREW_EXISTS" == "false" ]]; then
    return 1
  elif [[ "$1" == "aws" && "$MOCKED_AWS_EXISTS" == "true" ]]; then
    echo "/usr/local/bin/aws"
    return 0
  else
    return 1
  fi
}

mock_aws() {
  if [[ "$1" == "--version" ]]; then
    if [[ -n "$MOCKED_AWS_VERSION" ]]; then
      echo "aws-cli/$MOCKED_AWS_VERSION Python/3.9.1"
      return 0
    else
      return 1
    fi
  fi
}

mock_pip3() {
  if [[ "$1" == "install" && "$2" == "-U" && "$3" == "awscli" ]]; then
    echo "pip3 install -U awscli called"
    return 0
  fi
  return 1
}

mock_curl() {
  if [[ "$1" == "-fsSL" && "$2" == "https://raw.githubusercontent.com/Homebrew/install/master/install" ]]; then
    echo "Mock Homebrew install script"
    return 0
  elif [[ "$1" == "-sSL" && "$2" == "https://api.github.com/repos/aws/aws-cli/tags" ]]; then
    echo '[{"name": "2.15.0"}, {"name": "2.14.0"}]' # Mock latest and current
    return 0
  fi
  return 1
}

mock_jq() {
  if [[ "$1" == "-e" && "$2" == "-r" && "$3" == ".[1].name" ]]; then
    echo "2.14.0" # Mock current version from API
    return 0
  fi
  return 1
}

mock_brew() {
  if [[ "$1" == "install" && "$2" == "jq" && "$3" == "python3" ]]; then
    echo "brew install jq python3 called"
    return 0
  fi
  return 1
}

mock_apt_get() {
  if [[ "$1" == "install" && "$2" == "python3" && "$3" == "jq" ]]; then
    echo "apt-get install python3 jq called"
    return 0
  fi
  return 1
}

mock_yum() {
  if [[ "$1" == "-y" && "$2" == "install" && "$3" == "python3" && "$4" == "jq" ]]; then
    echo "yum -y install python3 jq called"
    return 0
  fi
  return 1
}

# Override commands with mocks
uname() { mock_uname "$@"; }
which() { mock_which "$@"; }
aws() { mock_aws "$@"; }
pip3() { mock_pip3 "$@"; }
curl() { mock_curl "$@"; }
jq() { mock_jq "$@"; }
brew() { mock_brew "$@"; }
apt-get() { mock_apt_get "$@"; }
yum() { mock_yum "$@"; }

# Source the script to be tested
# This needs to be done carefully to avoid executing the script directly
# and instead allow the test functions to control its execution.
# We'll wrap the script's execution in test functions.

# Test functions
setUp() {
  # Reset mocks before each test
  MOCKED_UNAME=""
  MOCKED_BREW_EXISTS="true"
  MOCKED_AWS_EXISTS="true"
  MOCKED_AWS_VERSION=""
  # Clear environment variables that the script might set
  unset AWSVERSION AWSCURRENT
}

test_darwin_brew_not_installed() {
  MOCKED_UNAME="Darwin"
  MOCKED_BREW_EXISTS="false"
  MOCKED_AWS_EXISTS="false" # Simulate no AWS CLI initially

  # Capture stdout and stderr
  output=$(bash ../awscli.sh 2>&1)

  # Assertions
  assertContains "$output" "Mock Homebrew install script"
  assertContains "$output" "brew install jq python3 called"
  assertContains "$output" "pip3 install -U awscli called"
  assertContains "$output" "AWS CLI not found. Installing..."
}

test_darwin_brew_installed_aws_outdated() {
  MOCKED_UNAME="Darwin"
  MOCKED_BREW_EXISTS="true"
  MOCKED_AWS_EXISTS="true"
  MOCKED_AWS_VERSION="2.13.0" # Older version

  output=$(bash ../awscli.sh 2>&1)

  assertContains "$output" "Your AWS CLI version is: 2.13.0"
  assertContains "$output" "Your AWS CLI version (2.13.0) is outdated. Updating to 2.14.0..."
  assertContains "$output" "pip3 install -U awscli called"
}

test_ubuntu_aws_not_installed() {
  MOCKED_UNAME="Ubuntu"
  MOCKED_AWS_EXISTS="false"

  output=$(bash ../awscli.sh 2>&1)

  assertContains "$output" "apt-get install python3 jq called"
  assertContains "$output" "AWS CLI not found. Installing..."
  assertContains "$output" "pip3 install -U awscli called"
}

test_redhat_aws_up_to_date() {
  MOCKED_UNAME="RedHat"
  MOCKED_AWS_EXISTS="true"
  MOCKED_AWS_VERSION="2.14.0" # Up to date version

  output=$(bash ../awscli.sh 2>&1)

  assertContains "$output" "yum -y install python3 jq called"
  assertContains "$output" "Your AWS CLI version is: 2.14.0"
  assertContains "$output" "Your version of AWS CLI is up to date! Nothing to do."
}

test_centos_aws_outdated() {
  MOCKED_UNAME="CentOS"
  MOCKED_AWS_EXISTS="true"
  MOCKED_AWS_VERSION="2.10.0" # Older version

  output=$(bash ../awscli.sh 2>&1)

  assertContains "$output" "yum -y install python3 jq called"
  assertContains "$output" "Your AWS CLI version is: 2.10.0"
  assertContains "$output" "Your AWS CLI version (2.10.0) is outdated. Updating to 2.14.0..."
  assertContains "$output" "pip3 install -U awscli called"
}

test_unsupported_os_no_aws() {
  MOCKED_UNAME="FreeBSD" # Unsupported OS
  MOCKED_AWS_EXISTS="false"

  output=$(bash ../awscli.sh 2>&1)
  exit_code=$?

  assertContains "$output" "Unsupported OS for AWS CLI installation. Please install manually."
  assertEquals 1 "$exit_code"
}

test_unsupported_os_aws_outdated() {
  MOCKED_UNAME="FreeBSD" # Unsupported OS
  MOCKED_AWS_EXISTS="true"
  MOCKED_AWS_VERSION="2.10.0" # Older version

  output=$(bash ../awscli.sh 2>&1)
  exit_code=$?

  assertContains "$output" "Unsupported OS for AWS CLI update. Please update manually."
  assertEquals 1 "$exit_code"
}

# Source shunit2. This must be at the very end of the file.
# Make sure shunit2 is accessible, e.g., by downloading it to the same directory.
# shellcheck disable=SC1091
. "$(dirname "$0")/shunit2"
