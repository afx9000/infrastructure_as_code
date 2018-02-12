#!/bin/bash

cd terraform/aws/demo

terraform init -input=false

terraform plan --destroy -out=tfplan -input=false

terraform apply -input=false tfplan
