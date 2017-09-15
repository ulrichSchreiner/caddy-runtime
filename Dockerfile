FROM alpine:3.6
LABEL maintainer="ulrich.schreiner@gmail.com"

ARG CADDY_UID=2002
ARG CADDY_GID=2002

RUN apk --no-cache add ca-certificates libcap && mkdir /conf
WORKDIR /srv
COPY Caddyfile /conf/Caddyfile
COPY index.html /srv/index.html

RUN addgroup -S -g ${CADDY_GID} caddy \
    && adduser -u ${CADDY_UID} -D -S -s /sbin/nologin -G caddy caddy \
    && chown -R caddy:caddy /srv
ONBUILD COPY --from=builder /go/src/github.com/mholt/caddy/caddy/caddy /usr/bin/
ONBUILD RUN setcap cap_net_bind_service=+ep /usr/bin/caddy
EXPOSE 80 443 2015
ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/conf/Caddyfile"]
