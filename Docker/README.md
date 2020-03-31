# Docker

## Containers
- One server, one OS
- Compared to VMs, one server, seperate OS for each VM

## Commands
Management commands and commands.<br/>
Docker hub - github of docker. pulls images if it is not in your system. 

- `docker command`
- `docker container run -it --publish 80:80 nginx` - run in interactive mode (background) (sysmtem port:default port for software - name of image)
- `docker container ls` - shows running containers
- `docker container ls -a` shows all containers in the system
- `docker container rm "container id"` - remove existing specified container
- `docker container images` - shows existing images in the system
