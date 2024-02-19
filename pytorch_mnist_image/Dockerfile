# Build the manager binary
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

WORKDIR /test

# Install MNIST requirements
COPY mnist_pip_requirements.txt requirements.txt
RUN pip install --requirement requirements.txt

# Prepare MNIST script
COPY mnist.py mnist.py
COPY download_dataset.py download_dataset.py
RUN torchrun download_dataset.py

# Allow root group to access test folder
RUN chgrp -R 0 /test && \
    chmod -R g+rwX /test

USER 65532:0
COPY entrypoint.sh entrypoint.sh
ENTRYPOINT ["/test/entrypoint.sh"]
