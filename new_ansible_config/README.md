# Development Environment Setup

Standardized Ansible configuration for setting up a development environment on Linux (WSL2/native) or macOS.

## Prerequisites

- Ansible installed (`pip install ansible`)
- Git installed
- Internet connection

## Quick Start

1. Install Ansible collections:
   ```bash
   ansible-galaxy install -r requirements.yml
   ```

2. Run the setup:
   ```bash
   ./setup.sh setup
   ```

3. (Optional) Install VS Code extensions:
   ```bash
   ./setup.sh extensions
   ```

   Or run everything at once:
   ```bash
   ./setup.sh full
   ```

## What Gets Installed

### Core Tools
- **Shell**: Zsh with Starship prompt
- **Package Manager**: Homebrew (Linux/macOS)
- **Version Control**: Git with SSH key generation
- **Text Processing**: ripgrep, fd, bat, eza
- **Fuzzy Finder**: fzf with custom key bindings

### Development Tools
- **Languages**: Python (pyenv), Rust (cargo), Node.js (nvm)
- **Package Managers**: Poetry, pip
- **Containers**: Docker (Linux only)
- **Kubernetes**: kubectl
- **Build Tools**: just, make
- **Environment**: direnv for project-specific environments

### Shell Features
- Smart git branch switching with `gsw`
- Enhanced history search with Ctrl+R
- Directory navigation with zoxide
- Syntax highlighting and autosuggestions
- Custom aliases for common commands

## Platform Differences

### macOS
- Uses Homebrew from `/opt/homebrew` (Apple Silicon) or `/usr/local` (Intel)
- Includes VS Code PATH integration
- Native zsh-syntax-highlighting/autosuggestions

### Linux
- Uses Linuxbrew from `/home/linuxbrew/.linuxbrew`
- Installs Docker with user group setup
- Package manager integration for zsh plugins

## Configuration Files

- `playbook.yml` - Main setup playbook
- `extensions.yml` - VS Code extensions installer
- `templates/zshrc.j2` - Zsh configuration template
- `inventory.ini` - Ansible inventory
- `requirements.yml` - Required Ansible collections

## Customization

Edit the template files to customize:
- Shell aliases and functions
- Environment variables
- Tool configurations
- Package lists

## Troubleshooting

1. **Homebrew installation fails**: Ensure you have admin privileges
2. **SSH key generation fails**: Check if key already exists
3. **Docker permission denied**: Log out and back in after installation
4. **VS Code extensions fail**: Ensure VS Code is in PATH

## Manual Steps

After running the playbook:
1. Add the generated SSH key to your GitHub account
2. Restart your terminal or run `source ~/.zshrc`
3. Configure any additional VS Code settings manually
