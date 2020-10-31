FROM ubuntu:20.04

RUN set -ex;                                    \
    apt-get update;                             \
    apt-get install -y --no-install-recommends  \
      ca-certificates                           \
      curl                                      \
      jq;                                       \
    rm -rf /var/lib/apt/lists/*;

ADD entrypoint.sh .

ENTRYPOINT [ "/entrypoint.sh" ]
