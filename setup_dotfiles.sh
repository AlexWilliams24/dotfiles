#!/bin/bash

# Define the URL of your dotfiles repository on GitHub
REPO_URL="https://github.com/AlexWilliams24/dotfiles.git"
BRANCH="main"  # Change this to the branch you're using (default is usually 'main')

# Define the destination file path for .vimrc in the user's home directory
VIMRC_DEST="$HOME/.vimrc"
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"

# Download the .vimrc file from the GitHub repository
echo "Downloading .vimrc from your GitHub repository..."

curl -sS "$REPO_URL/raw/$BRANCH/.vimrc" -o "$VIMRC_DEST"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo ".vimrc successfully copied to $VIMRC_DEST"
else
    echo "Failed to download .vimrc. Please check the repository URL and branch."
    exit 1
fi

# Check if Vundle is already installed
if [ ! -d "$VUNDLE_DIR" ]; then
    echo "Vundle is not installed. Installing Vundle..."

    # Install Vundle by cloning the repository into the appropriate directory
    git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"

    # Check if Vundle was installed successfully
    if [ $? -eq 0 ]; then
        echo "Vundle successfully installed!"
    else
        echo "Failed to install Vundle. Please check your git installation."
        exit 1
    fi
else
    echo "Vundle is already installed at $VUNDLE_DIR"
fi

# Run :PluginInstall using Vim in non-interactive mode
echo "Running :PluginInstall to install plugins..."
vim +PluginInstall +qall
# Check if the plugins were installed successfully
if [ $? -eq 0 ]; then
    echo "Plugins installed successfully!"
else
    echo "Failed to install plugins. Please check your .vimrc or Vundle configuration."
    exit 1
fi
