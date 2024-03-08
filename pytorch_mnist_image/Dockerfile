# Build the manager binary
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

WORKDIR /test

RUN mkdir -p /usr/local/share/ca-certificates/certs
COPY apps-ods-qe-psi-08-osp-rh-ods-com.crt /usr/local/share/ca-certificates/certs/apps-ods-qe-psi-08-osp-rh-ods-com.crt
ENV REQUESTS_CA_BUNDLE=/usr/local/share/ca-certificates/certs/apps-ods-qe-psi-08-osp-rh-ods-com.crt

# Allow root group to access test folder
RUN chgrp -R 0 /test && \
    chmod -R g+rwX /test

COPY mnist.py mnist.py

# ENTRYPOINT ["torchrun", "/test/mnist.py"]

COPY entrypoint.sh entrypoint.sh
RUN chmod +x /test/entrypoint.sh

ENTRYPOINT ["/bin/sh", "-c", "/test/entrypoint.sh"]
