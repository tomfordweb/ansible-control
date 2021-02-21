This is an ansible control machine based on an Ubuntu 20 image.

It contains a few extra ansible galaxy modules:
* community.general
* community.docker

# Use it
You can use this image with either `docker`, or `docker-compose`.

## docker
Here is an example passing the local machines `ssh-agent` to the container to use your private key.
```
SSH_AUTH_SOCK=/ssh-agent
docker run -it -v $(pwd):/ansible -v $SSH_AUTH_SOCK:/ssh-agent tomfordweb/ansible-control bash
```

## docker-compose

```yml
version: "3.7"

services: 
  ansible:
    image: tomfordweb/ansible-control
    container_name: ansible
    volumes:
      - ./:/ansible
      - $SSH_AUTH_SOCK:/ssh-agent
    environment:
      SSH_AUTH_SOCK: /ssh-agent
```

```
docker-compose run ansible bash
```

