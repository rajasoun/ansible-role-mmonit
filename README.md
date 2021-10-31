# M/Monit
-------

Ansible role for configuring M/Monit. 


## Install
-------
Install this role with [ansible-galaxy](https://galaxy.ansible.com/rajasoun/ansible_role_monit).

```shell
$ ansible-galaxy install rajasoun.ansible_role_mmonit
$ ansible-vault decrypt ~/.ansible/roles/rajasoun.ansible_role_mmonit/files/license.yml
$ ansible-playbook -i ~/.ansible/roles/rajasoun.ansible_role_mmonit/inventory ~/.ansible/roles/rajasoun.ansible_role_mmonit/local.yml
```

## Pre Requisites
------------

* An Ansible ready host.
* Following Certificates `ssl_certificate.crt` and `ssl_certificate_key.key` available in directort `/etc/certs/ssl/`


## Test
------------

Use [Multipass](https://multipass.run/) for creating VM Locally

1. Prepare Ansible Ready Host
```
$ git clone https://github.com/rajasoun/multipass-wrapper
$ cd multipass-wrapper
$ ./assist.bash multipass setup
$ ./assist.bash multipass status
$ ./assist.bash multipass shell
$ sudo apt-get update && sudo apt-get upgrade && sudo apt-get install ansible -y
```

2. Copy SSL Certificates `ssl_certificate.crt` and `ssl_certificate_key.key` available in directort `/etc/certs/ssl/` inside VM
```
sudo mkdir -p /etc/certs/ssl/
sudo touch /etc/certs/ssl/ssl_certificate.crt
sudo touch /etc/certs/ssl/ssl_certificate_key.key
sudo chmod 0440 /etc/certs/ssl/
```

3. Run Ansible Playbook 

```
$ ansible-galaxy install rajasoun.ansible_role_mmonit
$ ansible-vault decrypt ~/.ansible/roles/rajasoun.ansible_role_mmonit/files/license.yml
$ ansible-playbook -i ~/.ansible/roles/rajasoun.ansible_role_mmonit/inventory ~/.ansible/roles/rajasoun.ansible_role_mmonit/local.yml

```

## Role Variables
--------------
    * mmonit_server_ip - IP Address of the VM, mmonit is being configured

## Login
--------------

MMonit will be available in port 80 and 443 with automatic redirect from 80 to 443

| Url | Username | Password |
|--- |--- |--- |
| http://<server-name> | mmonit | mmonit |

