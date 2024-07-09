FROM caddy:builder-alpine as builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/route53 \
    --with github.com/porech/caddy-maxmind-geolocation \
    --with github.com/ggicci/caddy-jwt

FROM caddy:alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy