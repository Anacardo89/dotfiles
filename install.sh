#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Installing dotfiles from $DOTFILES_DIR"

# Helper function to create symlink with backup
link_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "Backing up existing $dest to ${dest}.backup"
        mv "$dest" "${dest}.backup"
    fi

    echo "Linking $src to $dest"
    ln -s "$src" "$dest"
}

# Symlink main config files
link_file "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# Ensure .bashrc.d directory exists and symlink scripts inside it
mkdir -p "$HOME/.bashrc.d"

for script in $DOTFILES_DIR/.bashrc.d/*.sh; do
    dest="$HOME/.bashrc.d/$(basename "$script")"
    link_file "$script" "$dest"
done

echo "Dotfiles installation complete."
echo "Existing configs backed up with .backup suffix."
