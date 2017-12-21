# Packer

## Rigor Quick Start
1. Have docker installed
1. Clone this repo
1. Build the thing  
    ```sh
    docker-compose up
    ```
1. Find the new binary in `./bin`

## Quick Start
Download and install packages and dependencies
```
go get github.com/hashicorp/packer
```

**Note:** There is a great
[introduction and getting started guide](https://www.packer.io/intro)
for those with a bit more patience. Otherwise, the quick start below
will get you up and running quickly, at the sacrifice of not explaining some
key points.

First, [download a pre-built Packer binary](https://www.packer.io/downloads.html)
for your operating system or [compile Packer yourself](CONTRIBUTING.md#setting-up-go-to-work-on-packer).

After Packer is installed, create your first template, which tells Packer
what platforms to build images for and how you want to build them. In our
case, we'll create a simple AMI that has Redis pre-installed. Save this
file as `quick-start.json`. Export your AWS credentials as the
`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variables.

```json
{
  "variables": {
    "access_key": "{{env `AWS_ACCESS_KEY_ID`}}",
    "secret_key": "{{env `AWS_SECRET_ACCESS_KEY`}}"
  },
  "builders": [{
    "type": "amazon-ebs",
    "access_key": "{{user `access_key`}}",
    "secret_key": "{{user `secret_key`}}",
    "region": "us-east-1",
    "source_ami": "ami-af22d9b9",
    "instance_type": "t2.micro",
    "ssh_username": "ubuntu",
    "ami_name": "packer-example {{timestamp}}"
  }]
}
```

Next, tell Packer to build the image:

```
$ packer build quick-start.json
...
```

Packer will build an AMI according to the "quick-start" template. The AMI
will be available in your AWS account. To delete the AMI, you must manually
delete it using the [AWS console](https://console.aws.amazon.com/). Packer
builds your images, it does not manage their lifecycle. Where they go, how
they're run, etc. is up to you.

## Documentation

Comprehensive documentation is viewable on the Packer website:

https://www.packer.io/docs

## Developing Packer

See [CONTRIBUTING.md](https://github.com/hashicorp/packer/blob/master/CONTRIBUTING.md) for best practices and instructions on setting up your development environment to work on Packer.
