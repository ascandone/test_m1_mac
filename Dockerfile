FROM elixir:1.14

COPY entrypoint /entrypoint

ENTRYPOINT ["/entrypoint"]