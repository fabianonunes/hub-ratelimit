FROM alpine:3.13

RUN apk add --no-cache curl jq;

ADD entrypoint.sh .

ENTRYPOINT [ "/entrypoint.sh" ]
