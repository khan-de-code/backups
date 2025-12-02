#!/bin/bash
set -e

case "${1:-help}" in
    install)
        echo "Installing Ansible collections..."
        ansible-galaxy install -r requirements.yml
        ;;
    setup)
        echo "Running main setup..."
        ansible-galaxy install -r requirements.yml
        ansible-playbook -i inventory.ini playbook.yml
        ;;
    extensions)
        echo "Installing VS Code extensions..."
        ansible-playbook -i inventory.ini extensions.yml
        ;;
    full)
        echo "Running complete setup..."
        ansible-galaxy install -r requirements.yml
        ansible-playbook -i inventory.ini playbook.yml
        ansible-playbook -i inventory.ini extensions.yml
        ;;
    *)
        echo "Usage: $0 {install|setup|extensions|full}"
        echo "  install     - Install Ansible collections"
        echo "  setup       - Run main environment setup"
        echo "  extensions  - Install VS Code extensions"
        echo "  full        - Complete setup with extensions"
        ;;
esac
