FROM alpine:latest

RUN apk add --no-cache bash curl

COPY update-nextdns.sh /usr/local/bin/update-nextdns.sh

RUN chmod +x /usr/local/bin/update-nextdns.sh

CMD while true; do /usr/local/bin/update-nextdns.sh; sleep 300; done
