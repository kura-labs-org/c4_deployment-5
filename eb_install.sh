#!/bin/bash

# Update package list and install necessary dependencies
sudo apt-get update
sudo apt-get install -y software-properties-common

# Add deadsnakes PPA and install Python 3.7
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install -y python3.7 python3.7-venv

# Install pip (Python package installer)
sudo apt-get install -y python3-pip

# Clone the repository
git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git
cd aws-elastic-beanstalk-cli-setup/scripts

# Create a virtual environment with Python 3.7
python3.7 -m venv ebcli-venv

# Activate the virtual environment
source ebcli-venv/bin/activate

# Install the EB CLI
pip install awsebcli --upgrade

# Display EB CLI version
eb --version

echo "EB CLI installation completed."
