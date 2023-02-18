FROM docker.io/elixir:1.13

RUN apt-get update && apt-get -y install inotify-tools && \ 
    mix do local.hex --force, local.rebar --force

WORKDIR /app

COPY mix.exs mix.lock ./
RUN mix do deps.get, deps.compile

