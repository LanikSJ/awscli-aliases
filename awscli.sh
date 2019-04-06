#!/usr/bin/env bash
# This script will install/Update AWS CLI

# Install / Update Function

if [[ uname == "Darwin" ]]; then which brew >/dev/null && if [ "$?" = "0" ]; then /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; fi && brew install jq python3; fi

if [[ uname == "Ubuntu" ]]; then apt-get install python3 jq; fi

if [[ uname == "RedHat" ]] || [[ uname == "CentOS" ]]; then yum -y install python3 jq; fi

# Variables
export AWSVERSION=$(aws --version | awk -F"/" '{print $2}' | sed 's/ Python//')
export AWSCURRENT=$(curl -sSL https://api.github.com/repos/aws/aws-cli/tags | jq -e -r '.[0].name')

if [[ $AWSCURRENT == *"dev"* ]]; then export AWSCURRENT=$(curl -sSL https://api.github.com/repos/aws/aws-cli/tags | jq -e -r '.[1].name'); fi

if [[ -z $AWSVERSION ]]; then pip3 install -U awscli; else echo "Your AWS CLI version is: $AWSVERSION"; fi

if [[ $AWSVERSION < "$AWSCURRENT" ]]; then pip3 install -U awscli; else echo "Your version of AWS CLI is up to date! Nothing to do. "; fi
