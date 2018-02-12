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
To satisfy the need to provision the infrastructure in a single command, I have included the script `provision.sh`. Simply run `./provision.sh` in this directory once you have confirmed your aws keys work correctly.

## Destroying
To simplify destruction of the infrastructure, I have included `destroy.sh`. Simply run `./destroy.sh` in this directory once you have no more need for the insfrastructure to run.

## Verification
To simplify the verification of properly running docker containers, in addition to the standard `hello world` container, I have also included a [web version of hello-world](https://hub.docker.com/r/infrastructureascode/hello-world/) that you can visit by navigiting to the public IP of any of the instances either with a web browser or curl/wget. This, I thought, would be easier than having to SSH into the box.
