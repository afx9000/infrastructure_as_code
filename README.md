# infrastructure_as_code

## Authentication
Please set the following environment variables. Due to the fact that this is a demo, it is assumed that there is no MFA setup for your account and your keys will allow you the necessary access to provision the infrastructure.

```
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_DEFAULT_REGION="us-east-2"
```

## Tools
The only tools needed to provision the infrastructure are `terraform` and `bash`.


## Provisioning
To satisfy the need to provision the infrastructure in a single command, I have included the script `provision.sh`.
Simply run `./provision.sh` in this directory once you have confirmed your aws keys work correctly.
