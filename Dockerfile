FROM alpine:3.6

ARG DUMB_INIT_VERSION=1.2.0

ADD https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_amd64 /usr/local/bin/dumb-init

RUN chmod +x /usr/local/bin/dumb-init

COPY migrate /bin/migrate

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]

CMD ["/bin/migrate"]
