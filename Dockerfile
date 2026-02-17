FROM library/caddy:2.10.2-builder AS builder
RUN xcaddy build --with github.com/caddy-dns/cloudflare
RUN xcaddy build --with github.com/enoqv/caddy-l4

FROM caddy:2.10.2-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy