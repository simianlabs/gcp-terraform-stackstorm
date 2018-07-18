# StackStorm Docker - GCP

Version `1.0.0`

## Description
Provision single node instance of dockerized version of StackStorm 2 in Google Cloud.

St2docker documentation: https://github.com/StackStorm/st2-docker

`This will be converted to module later.`

## Usage

Use Google Cloud SDK to authentificate:

```
$ gcloud auth login

$ gcloud config set project GCP-PROJECT
```


Modify `terrraform.tfvars` to change zone, cidr and sizing.

Run terraform to build resources:
```
$ terraform apply
```

After all resources are build, it will take a while until StackStorm will be availabe (Installing packages, pulling immage might take a while)

Log to machine and check `/tmp/startup.log` to see current progress.


## Maintainer

Simian Labs - (https://github.com/simianlabs)  
http://simianlabs.io || smonko@simianlabs.io