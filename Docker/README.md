# Docker

## Containers
- One server, one OS
- Compared to VMs, one server, seperate OS for each VM

## Commands
Management commands and commands.<br/>
Docker hub - github of docker. pulls images if it is not in your system. 

- `docker command`
- `docker container run -it --publish 80:80 nginx` - run in interactive mode (execute commands at time of running) (sysmtem port:default port for software - name of image)
- `docker container ls` - shows running containers
- `docker container ls -a` shows all containers in the system
- `docker container rm "container id"` - remove existing specified container
- `docker container images` - shows existing images in the system
- `docker image rm image_id` - removes the specified image
- `docker pull container_name` - pulls the image
- `docker container run -d -p 8080:80 --name mynginx nginx` - (-d = detach mode), publish customName, name of container
- `docker stop container_name` - stop container
- `docker container run -d -p 3306:3306 --name mysql --env MYSQL_ROOT_PASSWORD=123456 mysql ` - for setting environmental variables
