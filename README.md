## Virtual Machine Image Builds
Automation for building virtual machine images.

* Hashicorp Packer used for image creation
* Ansible is used for image customization
* Test Kitchen and Inspec used for testing

## Directory Layout
```
images
|__ base-centos7
|   |__ build.json
|   |
|   |__ .kitchen.yml
|   |
|   |__ playbooks
|   |   |
|   |   |__ main.yml
|   |
|   |__ test
|       |
|       |__ TBD
|    
|__ jenkins-centos7
    |__ build.json
    |
    |__ .kitchen.yml
    |
    |__ playbooks
    |   |
    |   |__ main.yml
    |
    |__ test
        |
        |__ TBD
```
