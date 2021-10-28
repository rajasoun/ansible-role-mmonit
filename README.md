# M/Monit
-------

Ansible role for configuring M/Monit. 


## Install
-------
Install this role with [ansible-galaxy](https://galaxy.ansible.com/rajasoun/ansible_role_monit).

```shell
$ ansible-galaxy install rajasoun.ansible_role_mmonit
$ ansible-playbook -i ~/.ansible/roles/rajasoun.ansible_role_mmonit/inventory ~/.ansible/roles/rajasoun.ansible_role_mmonit/local.yml
```

## Pre Requisites
------------

An Ansible ready host.


## Test
------------

Use [Multipass](https://multipass.run/) for creating VM Locally

```
$ git clone https://github.com/rajasoun/multipass-wrapper
$ cd multipass-wrapper
$ ./assist.bash multipass setup
$ ./assist.bash multipass status
$ ./assist.bash multipass shell
$ sudo apt-get install ansible -y
$ ansible-playbook -i ~/.ansible/roles/rajasoun.ansible_role_mmonit/inventory ~/.ansible/roles/rajasoun.ansible_role_mmonit/local.yml

```

## Role Variables
--------------
    * mmonit_server_ip - IP Address of the VM, mmonit is being configured

## Login
--------------

| Url | Username | Password |
|--- |--- |--- |
| http://www.example.org:2811 | admin | swordfish |

