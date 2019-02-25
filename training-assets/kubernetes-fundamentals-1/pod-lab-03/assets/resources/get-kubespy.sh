#!/usr/bin/env bash

curl -LO https://github.com/pulumi/kubespy/releases/download/v0.3.0/kubespy_linux-amd64
mv kubespy_linux-amd64 /bin/kubespy
chmod +x /bin/kubespy
