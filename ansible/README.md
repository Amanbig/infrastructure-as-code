# 📜 Ansible: Agentless IT Automation & Configuration Management

Welcome to the **Ansible** section of this repository. Ansible is an open-source IT engine that automates cloud provisioning, configuration management, application deployment, intra-service orchestration, and continuous delivery.

---

## 🗺️ Directory Structure

```
ansible/
├── ansible.cfg                    # Default configuration (inventory path, SSH tuning)
├── inventories/
│   ├── hosts.ini                  # Inventory file defining host groups & IP addresses
│   └── group_vars/                # Variables scoped by host groups
│       ├── all.yml                # Variables available to every host
│       └── webservers.yml         # Variables targeted at webservers group
├── playbooks/
│   ├── 01-ping-and-setup.yml      # Host connectivity & system update
│   ├── 02-install-docker.yml      # Complete Docker Engine & containerd setup
│   ├── 03-deploy-nginx.yml        # Nginx setup using handlers for clean restarts
│   ├── 04-security-hardening.yml  # UFW firewall & SSH key hardening
│   └── site.yml                   # Master playbook orchestrating roles
└── roles/                         # Reusable, modular playbooks
    ├── common/
    │   └── tasks/main.yml         # Shared base tasks
    └── webserver/
        ├── tasks/main.yml         # Web server installation tasks
        ├── templates/index.html.j2 # Dynamic Jinja2 landing page
        └── handlers/main.yml      # Service reload/restart handlers
```

---

## 🧠 Key Principles of Ansible

1. **Agentless Architecture**: No agent or software needs to be installed on remote managed nodes. Ansible operates over standard OpenSSH (or WinRM for Windows).
2. **Idempotency**: Running a playbook once or a hundred times results in the same safe target state. Tasks only change system state if a difference is detected.
3. **YAML-Based (Playbooks)**: Human-readable declarative language describing desired state.
4. **Push-Based**: Control node initiates actions and pushes configurations directly to remote nodes.

---

## 🛠️ Essential Ansible CLI Commands

### 1. Ad-Hoc Commands (Quick Tasks)
```bash
# Ping all hosts in inventory
ansible all -m ping

# Check disk space on webservers
ansible webservers -a "df -h"

# Install package with become (sudo)
ansible webservers -b -m apt -a "name=curl state=present"

# Check facts gathered from a specific host
ansible web-01 -m setup
```

### 2. Running Playbooks
```bash
# Syntax check before execution
ansible-playbook -i inventories/hosts.ini playbooks/01-ping-and-setup.yml --syntax-check

# Dry-run (Check mode) - simulates changes without applying
ansible-playbook -i inventories/hosts.ini playbooks/03-deploy-nginx.yml --check

# Execute playbook
ansible-playbook -i inventories/hosts.ini playbooks/03-deploy-nginx.yml

# Execute master site playbook against a subset of hosts (limit)
ansible-playbook -i inventories/hosts.ini playbooks/site.yml --limit webservers

# Run specific tags
ansible-playbook -i inventories/hosts.ini playbooks/site.yml --tags "nginx"
```

---

## 📑 File Links

- [ansible.cfg](ansible.cfg)
- [hosts.ini](inventories/hosts.ini)
- [all.yml](inventories/group_vars/all.yml)
- [webservers.yml](inventories/group_vars/webservers.yml)
- [01-ping-and-setup.yml](playbooks/01-ping-and-setup.yml)
- [02-install-docker.yml](playbooks/02-install-docker.yml)
- [03-deploy-nginx.yml](playbooks/03-deploy-nginx.yml)
- [04-security-hardening.yml](playbooks/04-security-hardening.yml)
- [site.yml](playbooks/site.yml)
- [roles/common/tasks/main.yml](roles/common/tasks/main.yml)
- [roles/webserver/tasks/main.yml](roles/webserver/tasks/main.yml)
- [roles/webserver/templates/index.html.j2](roles/webserver/templates/index.html.j2)
- [roles/webserver/handlers/main.yml](roles/webserver/handlers/main.yml)

---

## 🔗 Useful Official Resources
- [Official Ansible Documentation](https://docs.ansible.com/)
- [Ansible Galaxy (Community Roles & Collections)](https://galaxy.ansible.com/)
- [Ansible Best Practices Guide](https://docs.ansible.com/ansible/latest/tips_tricks/sample_setup.html)
