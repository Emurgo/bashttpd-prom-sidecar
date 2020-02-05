FROM ubuntu:bionic

VOLUME ["/data"]

RUN apt-get update -qy && \
    apt-get install -y socat sudo && \
    apt-get clean

ADD ./assets /assets
RUN chown -R nobody: /assets
WORKDIR /assets/bin

ENTRYPOINT ["/bin/bash", "-c", "chown -R nobody: /data; sudo -EHu nobody /assets/bin/entrypoint"]
