# Docker

## Containers
- One server, one OS
- Compared to VMs, one server, seperate OS for each VM

Dockerfile creates a docker image. Containers need to run an image to exist. Containers are dependent on images but not vice versa.

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
- `docker container exec -it mynginx bash` - bash into nginx container and see all the files
- `exit` - exit the container you bash into
- `docker container run -d -p 8080:80 -v $(pwd):/usr/share/nginx/html --name nginx-website nginx` - replace the file in the original directory with the file in your existing directory
- `docker image build -t boaringsquare/test-website .` - build your docker image
- `docker push boaringsquare/test-website` - push image into docker account
- `docker login` - for authentication 

## Useful links

https://gist.github.com/bradtraversy/89fad226dc058a41b596d586022a9bd3

Example of a `DockerFile`

```
FROM nginx:latest

WORKDIR /usr/share/nginx/html

COPY . .
```

## Using docker compose

Need to create a `docker-compose.yml file`

Eg:

```
version: '3'
services:
    app:
        container_name: docker-node-mongo
        restart: always
        build: .
        ports:
            - '80:3000'
        links:
            - mongo
    mongo:
        container_name: mongo
        image: mongo
        ports:
            - '27017:27017'
```

- run `docker-compose up`
- `docker-compose down` - removes images and connections (if any)

## Running your app in a container

Eg:

```
FROM node:10

# working directory - where my app will live
WORKDIR /usr/src/app

# copy package.json into working directory
COPY package*.json ./ 

# npm install inside the working directory of the container
RUN npm install

# Copy everything here into container
COPY . .

EXPOSE 3000

# run the command to start the app
CMD ["npm", "start"]
```

## Docker Volumes

Docker uses a read-only image layer and adds a read-write layer on top, where changes are applied. This is called union file system. To persist and share data between containers, docker uses volumes where they are directories that are outside of the union file system and exist as normal directories and files on the host filesystem.

https://blog.container-solutions.com/understanding-volumes-docker#:~:text=In%20order%20to%20be%20able,files%20on%20the%20host%20filesystem.

An example command to mount locally:

`sudo docker run -v ~/romi-dashboard:/root/romi-dashboard -it docker.pkg.github.com/osrf/romi-dashboard/e2e`

## Networking

When we want two different container in different networks to interact with each other, we can set up a known network in docker compose in one of the service. We can then connect to this service through the gateway ip address of the known network. Docker bridge would then perform an NAT and forwards the traffic to the exposed port.

When both containers are in the same network, linux uses arp to get the mac address and can connect to the service container via its IP address directly
