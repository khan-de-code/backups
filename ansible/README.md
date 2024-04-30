## Process

```bash
sudo apt install -y ansible

ansible-galaxy install -r requirements.yml

ansible-playbook -i inventory.ini playbook.yml --ask-become-pass
```