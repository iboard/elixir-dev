FROM elixir:latest

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs && \
    curl -L https://npmjs.org/install.sh | sh 

ENV APP_HOME /app
ENV USER="elixir"
ENV USER_ID=1001

WORKDIR "/home/${USER}/app"

EXPOSE 4000

RUN \
    addgroup -gid "${USER_ID}" "${USER}" \
    && adduser -shell /bin/sh -uid "${USER_ID}" --gid "${USER_ID}" "${USER}" \
        --home "/home/${USER}" \
    && su - "${USER}" \
    && mkdir -p "/home/${USER}/app" \
    && chown "${USER}:${USER}" "/home/${USER}"

# run as user
USER "${USER}"

RUN mix local.hex --force && \
    mix archive.install hex phx_new --force && \
    mix local.rebar --force

COPY .iex.exs /home/elixir/.iex.exs
COPY start_iex /home/elixir/start_iex
COPY start_server /home/elixir/start_server

ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["../start_server"]

