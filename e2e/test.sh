#!/bin/bash
set -x
set +e

terraform apply -auto-approve
curl -I http://localhost
python tests.py
