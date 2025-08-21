#!/usr/bin/env bash
# This script will install/Update AWS CLI

# Function to log messages
log_message() {
  echo "$@"
}

# Install / Update Function
if [[ "$(uname)" == "Darwin" ]]; then
  if ! which brew >/dev/null; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew install jq python3
fi

if [[ "$(uname)" == "Ubuntu" ]]; then
  apt-get install python3 jq
fi

if [[ "$(uname)" == "RedHat" ]] || [[ "$(uname)" == "CentOS" ]]; then
  yum -y install python3 jq
fi

# Variables
AWSVERSION=$(aws --version | awk -F"/" '{print $2}' | sed 's/ Python//')
export AWSVERSION
AWSCURRENT=$(curl -sSL https://api.github.com/repos/aws/aws-cli/tags | jq -e -r '.[1].name')
export AWSCURRENT

if [[ -z $AWSVERSION ]]; then
  log_message "AWS CLI not found. Installing..."
  if [[ "$(uname)" == "Darwin" ]]; then
    brew install awscli
  elif [[ "$(uname)" == "Ubuntu" ]]; then
    apt-get install awscli
  elif [[ "$(uname)" == "RedHat" ]] || [[ "$(uname)" == "CentOS" ]]; then
    yum install -y awscli
  else
    log_message "Unsupported OS for AWS CLI installation. Please install manually."
    exit 1
  fi
else
  log_message "Your AWS CLI version is: $AWSVERSION"
fi

if [[ $AWSVERSION < "$AWSCURRENT" ]]; then
  log_message "Your AWS CLI version ($AWSVERSION) is outdated. Updating to $AWSCURRENT..."
  if [[ "$(uname)" == "Darwin" ]]; then
    brew install awscli
  elif [[ "$(uname)" == "Ubuntu" ]]; then
    apt-get install -y awscli
  elif [[ "$(uname)" == "RedHat" ]] || [[ "$(uname)" == "CentOS" ]]; then
    yum install -y awscli
  else
    log_message "Unsupported OS for AWS CLI update. Please update manually."
    exit 1
  fi
else
  log_message "Your version of AWS CLI is up to date! Nothing to do. "
fi
