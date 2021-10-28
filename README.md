# M/Monit
-------

Ansible role for configuring M/Monit. 


## Install
-------
Install this role with [ansible-galaxy](https://galaxy.ansible.com/rajasoun/ansible_role_monit).

```shell
$ ansible-galaxy install rajasoun.ansible_role_monit
$ ansible-playbook -i ~/.ansible/roles/rajasoun.ansible_role_monit/inventory ~/.ansible/roles/rajasoun.ansible_role_monit/local.yml
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
$ ansible-playbook -i ~/.ansible/roles/rajasoun.ansible_role_monit/inventory ~/.ansible/roles/rajasoun.ansible_role_monit/local.yml

```

## Role Variables
--------------
    
    
    mmonit_connectors:
      - name: 'Default'
        address: '*'
        port: 2811
        processors: 10
    
    mmonit_workspace: '/opt'
    
    mmonit_admin_username: 'admin'
    mmonit_admin_password: ''
    
    mmonit_connector_username: 'connector'
    mmonit_connector_password: ''

## Secure Monit connector

    mmonit_connectors:
      - name: 'Secured'
        scheme: https
        address: '*'
        port: 8443
        processors: 10
        secure: true

## Login

| Url | Username | Password |
|--- |--- |--- |
| http://www.example.org:2811 | admin | swordfish |

