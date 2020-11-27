FROM alpine:3.7
LABEL maintainer="Myrtea Metrics <contact@myrteametrics.com>"

RUN apk update && apk add ca-certificates tzdata && rm -rf /var/cache/apk/*
RUN addgroup -S myrtea -g "1001" &&  \
    adduser -S myrtea -G myrtea -u "1001"

USER myrtea

WORKDIR /app

COPY bin/myrtea-holfuy-connector myrtea-holfuy-connector

ENTRYPOINT ["./myrtea-holfuy-connector"]
