# dotfiles

Personal scripts and configuration files to set up a new Linux environment quickly.

## Overview

This repository contains my essential shell scripts, environment variables, prompt customizations, and SSH agent setup to bootstrap a fresh Debian (or WSL) installation.

## Structure

Scripts are organized and loaded in order from the `~/.bashrc.d/` directory:

- `00_debian_init.sh` — Base Debian environment settings
- `10_prompt.sh` — Custom shell prompt with Git branch info
- `20_go_env.sh` — Go development environment variables
- `30_ssh_agent.sh` — SSH agent management for convenient key handling

## Usage

1. Clone this repo to your home directory or preferred location:

   ```bash
   git clone git@github.com:Anacardo89/dotfiles.git ~/.dotfiles
   ```

2. Run the installer script to set up your environment:

    ```bash
    ~/.dotfiles/install.sh
    ```
   This script will create necessary directories, symlink scripts to `~/.bashrc.d/`, and update your `~/.bashrc` to source them.

3. Open a new terminal or run `source ~/.bashrc` to apply changes.

**NOTE** The `.gitconfig` already includes `.gitconfig.local` for private user info, so just create and maintain that file separately in the home directory.
