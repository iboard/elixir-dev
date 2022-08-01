# elixir-dev README

_elixir-dev_ is a `Dockerfile` and a `docker-compose.yml` which runs an Elixi-/Phoenix
developer environment in a Docker container. Only the source code is mounted/exposed to
the developer's local workstation.

## Usage

### Windows 10 with GitBash

### 1st Clone the Docker-project `elixir-dev`

    ELIXIR_DEV_ROOT="<somewhere on the dev's workstation>"
    cd $ELIXIR_DEV_ROOT
    git clone git@github.com:iboard/elixir-dev.git
    cd elixir-dev
    
### 2nd (inside .../elixir-dev directory)

    # Optional
    mkdir postgresql
    
### 3rd Setup your .env file and create src-path

    SECRET_KEY_BASE=<a very long secret ... use mix phx.gen.secret
    
    mkdir src

### 4th Build the Docker image

    docker-compose build elixir-dev

### 5th Create a new Phoenix project

    docker-compose run --rm elixir-dev "mix phx.new --live --no-ecto hello"
    
edit `scr/hello/config/dev.ex` and change the endpoint's IP from 127.0.0.1 to 0.0.0.0
thus the network is visible from your host system.
    
### 6th Start the development container

    docker-compose up elixir-dev
    
The docker container should be running with console output in the foreground. You should be able to
visit http://localhost:4000 and see your 'hello' Liveview up and running.

### 6a Start the phoenix server in an IEX shell inside the container

    PROJECT=hello docker-compose run --rm -p 4000:4000 elixir-dev "iex -S mix phx.server"
    




tbc ...

Github-Issue

### Features

The following 'features' should be provided with the Docker-image

- [ ] Simple usage: clone, configure, build, use.
- [ ] Run `iex -S mix phx.server`, visit `localhost:4000`, edit source locally. 
- [ ] Run/Start the image with `mix phx.server` as a daemon.
- [ ] Run any command 'inside' the container/image. Eg. `mix ecto.gen migration` or even `/bin/bash`

The container runs with `./src/<project>` mounted at `/home/elixir/app/<source>` and can be used with several Elixir projects at the same time.

### DoD

- [ ] Documentation for use with Windows, Mac, Linux.
- [ ] Published as its own Github repository.
- [ ] A 'Quickstart' manual to be used with copy and paste.

### Background 💡

The Github repo and Docker-image should be a "show off thing" when collaborating with 
customers and partners. So, it shall shine ☀️ and make it easy to work with us 😄  


