#!/bin/bash

# Define required packages (Modify as needed)
REQUIRED_PACKAGES=("curl" "git" "vim" "tmux")

# Define dotfiles directory (Change if different)
DOTFILES_DIR="$HOME/dotfiles"
BASHRC_SOURCE="$DOTFILES_DIR/.bashrc"
BASHRC_DEST="$HOME/.bashrc"

# Function to check if running as root
check_sudo() {
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be run as root to install packages. Please run with sudo."
        exit 1
    fi
}

# Function to install missing packages
install_packages() {
    echo "Checking for required packages..."
    for package in "${REQUIRED_PACKAGES[@]}"; do
        if ! command -v "$package" &>/dev/null; then
            echo "Installing $package..."
            apt-get install -y "$package"
        else
            echo "$package is already installed."
        fi
    done
}

# Function to create a symbolic link for .bashrc
link_bashrc() {
    if [[ -f "$BASHRC_DEST" || -L "$BASHRC_DEST" ]]; then
        echo "Backing up existing .bashrc to .bashrc.bak"
        mv "$BASHRC_DEST" "$HOME/.bashrc.bak"
    fi

    echo "Creating symbolic link for .bashrc..."
    ln -s "$BASHRC_SOURCE" "$BASHRC_DEST"
}

# Function to remind user to reload their environment
reload_reminder() {
    echo -e "\nSetup complete!"
    echo "To apply changes, run: source ~/.bashrc"
    echo "Or log out and back in."
}

# Check if running as root for package installation
check_sudo

# Install necessary packages
install_packages

# Create symbolic link for .bashrc
link_bashrc

# Remind user to reload environment
reload_reminder

