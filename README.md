[![Build Status](https://travis-ci.com/seanmalloy/vm-image-builds.svg?branch=master)](https://travis-ci.com/seanmalloy/vm-image-builds)

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

## Credentials
### Google Cloud
1. GCE Instance With Service Account

Run from a GCE instace with a service
account that has the required GCP permissions
to run packer. This is the preferred option.

2. Environment Variable

Set the environment variable `GOOGLE_APPLICATION_CREDENTIALS`
to the path to a GCP service account credentials file and
export the variable.
