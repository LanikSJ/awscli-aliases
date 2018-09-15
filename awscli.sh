#!/usr/bin/env bash
# This script will install/Update AWS CLI

# Install / Update Function

if [[ uname !== "Darwin" ]]; then
  echo "This script is only designed for macOS X"
fi

# Variables
export AWSVERSION=$(aws --version | awk -F"/" '{print $2}' | sed 's/ Python//')
export AWSCURRENT=$(curl -sSL https://api.github.com/repos/aws/aws-cli/tags | jq -r '.[0].name')

if [[ -z $AWSVERSION ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install jq python3
  pip3 install -U awscli
else
  echo "Your AWS CLI version is: $AWSVERSION"
fi

if [[ $AWSVERSION < "$AWSCURRENT" ]]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install jq python3
  pip3 install -U awscli
else
  echo "Your version of AWS CLI is up to date! Nothing to do. "
fi
