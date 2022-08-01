# elixir-dev README

_elixir-dev_ is a `Dockerfile` and a `docker-compose.yml` which runs an Elixi-/Phoenix
developer environment in a Docker container. Only the source code is mounted/exposed to
the developer's local workstation.

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


