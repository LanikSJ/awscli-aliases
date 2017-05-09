#!/usr/bin/env bash

# Install / Update Function
awscli() {
  case `uname` in
    "Darwin" )
      type brew
      if [ $? != 0 ]
      then
        echo "brew not found. Please install at http://brew.sh"
        exit 1
      else
        echo "brew already installed..."
      fi

      type python3
      if [ $? != 0 ]
      then
        echo "python3 not found. Installing.."
        brew install python3
        if [ $? != 0 ]
        then
          echo "Failed to install python3.."
          exit 1
        fi
      else
        echo "python3 already installed..."
      fi

      type pip3
      if [ $? != 0 ]
      then
        echo "pip3 not found. Please correct."
        exit 1
      else
        echo "pip3 already installed..."
      fi

      pip3 show awscli
      if [ $? != 0 ]
      then
        echo "AWS CLI not installed using pip. Installing/Updating AWS CLI using Brew... "
        brew install awscli
      else
        echo "awscli already installed using pip, upgrading..."
        pip3 install -U awscli
      fi
    ;;
    Linux )
      echo "For Linux systems, please manually install / update AWS CLI. "
      exit 1
    ;;
    * )
      echo "`uname` is an unsupported OS. Please manually install / update AWS CLI. "
      exit 1
    ;;
  esac
}

# Write out AWS CLI version number
aws --version 2>/tmp/version.txt 1>&2

# Variables
AWSVERSION=$(cat /tmp/version.txt |awk -F"/" '{print $2}' |sed 's/ Python//')

echo "Your AWS CLI version is: $AWSVERSION"

if [[ -z $AWSVERSION ]]; then
  echo "AWS CLI isn't installed. Installing ... "
  awscli && rm -f /tmp/version.txt
fi

if [[ $AWSVERSION < '1.11.24' ]]; then
  echo "Your version of AWS CLI is out of date! Updating ... "
  awscli && rm -f /tmp/version.txt
else
  echo "Your version of AWS CLI is up to date! Nothing to do. "
  rm -f /tmp/version.txt
fi
