#!/bin/bash
set -x

terraform plan -out terraform.tfplan > /dev/null
python tests.py
