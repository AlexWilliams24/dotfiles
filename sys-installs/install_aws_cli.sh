#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script requires root privileges. Please run with sudo or as root."
    exit 1
fi

# Check if apt package manager is available
if ! command -v apt &> /dev/null; then
    echo "This script requires the apt package manager, but it was not found. Exiting."
    exit 1
fi

# Define the software to be installed
SOFTWARE="awscli"

# Check if the software name conflicts with an existing command
if command -v $SOFTWARE &> /dev/null; then
    echo "A command with the name '$SOFTWARE' already exists on this system. Installation aborted."
    exit 1
fi

# Inform the user about the installation and get confirmation
echo "The script will install $SOFTWARE. Do you want to proceed? (y/n)"
read -r RESPONSE
if [[ "$RESPONSE" != "y" ]]; then
    echo "Installation aborted by user."
    exit 1
fi

# Install the AWS CLI
echo "Installing $SOFTWARE..."
apt update && apt install -y $SOFTWARE

# Check if installation was successful
if ! command -v $SOFTWARE &> /dev/null; then
    echo "Installation failed. Please check for errors and try again."
    exit 1
fi

# Prompt the user that installation is complete
echo "$SOFTWARE has been successfully installed. You can check the version by running:"
echo "aws --version"

