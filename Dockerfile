FROM alpine:latest

RUN apk add --no-cache --update \
    samba-common-tools \
    samba-client \
    samba-server

COPY smb.conf /etc/samba/smb.conf

EXPOSE 445/tcp

CMD ["smbd", "--foreground", "--log-stdout"]

