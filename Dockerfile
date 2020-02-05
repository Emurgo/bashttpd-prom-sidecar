FROM ubuntu:bionic

RUN apt-get update -qy && \
    apt-get install -y socat && \
    apt-get clean

ADD ./assets /assets
USER nobody
ENTRYPOINT ["/assets/bin/entrypoint"]
