# Build the manager binary
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

RUN apt update -y || true
RUN apt install curl -y || true

WORKDIR /test

# Install MNIST requirements
RUN pip install requests pip_system_certs

# Prepare MNIST script
COPY mnist.py mnist.py

RUN mkdir -p /usr/local/share/ca-certificates/certs

# Allow root group to access test folder
RUN chgrp -R 0 /test && \
    chmod -R g+rwX /test

COPY entrypoint.sh entrypoint.sh

RUN ["chmod", "+x", "/test/entrypoint.sh"]

ENTRYPOINT ["/bin/sh", "-c", "/test/entrypoint.sh"]
