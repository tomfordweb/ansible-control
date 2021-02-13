.....
This is an ansible control machine based on an ubuntu image that contains the dependancies needed for the following modules:

* [community.general.proxmox](https://docs.ansible.com/ansible/latest/collections/community/general/proxmox_module.html) 

The image also includes `vim` for the "hit it with a hammer" approach when things aren't working right on the machine.

# Use it
You can use this image with either plain-ol `docker`, or `docker-compose`.

Yo

## docker
Here is an example passing the local machines `ssh-agent` to the container to use your private key.
```
SSH_AUTH_SOCK=/ssh-agent
docker run -it -v $(pwd):/ansible -v $SSH_AUTH_SOCK:/ss-agent tomfordweb/ansible-control bash
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

