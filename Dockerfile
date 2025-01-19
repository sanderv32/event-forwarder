FROM alpine:latest

# Run as root because otherwise we need to do a lot of chowning on the nodes
RUN apk add --no-cache rsyslog envsubst
RUN mkdir -p /var/lib/rsyslog/
RUN chown -R 0:0 /etc/rsyslog.conf
RUN chown -R 0:0 /var/run/
RUN chown -R 0:0 /var/lib/rsyslog/
USER root

COPY --chown=root:root entrypoint.sh /entrypoint.sh
COPY --chown=root:root rsyslog.conf /etc/rsyslog.conf
COPY --chown=root:root rsyslog.conf.tmpl /etc/rsyslog.conf.tmpl

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/rsyslogd", "-n"]
