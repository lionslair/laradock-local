FROM caddy/caddy:latest

COPY ./caddy/Caddyfile /etc/caddy/Caddyfile

ENTRYPOINT ["/usr/bin/caddy"]

CMD ["run", "--conf", "/etc/caddy/Caddyfile", "--log", "stdout", "--agree=true"]

EXPOSE 80 443
