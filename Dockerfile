FROM alpine:latest

RUN apk add --no-cache --update \
    samba-common-tools \
    samba-client \
    samba-server

COPY smb.conf /etc/samba/smb.conf
COPY scripts /usr/local/bin/

EXPOSE 445/tcp

ENTRYPOINT ["entrypoint.sh"]

# CMD ["smbd", "--foreground", "--log-stdout", "--no-process-group"]
