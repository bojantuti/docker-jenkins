
# Specify the base image (FROM)
FROM node:latest

# Specify the maintainer (MAINTAINER)
MAINTAINER Bojan

# Create an environment variable (ENV)
ENV CONTAINER_PATH /var/www/angular2restfulservice

# Add a file or directory (ADD)
WORKDIR   $CONTAINER_PATH

# Run a command (RUN)
RUN npm install nodemon -g

EXPOSE 3000

# What process to run when launching a container from this image (CMD)

ENTRYPOINT ["nodemon", "server.js"]


# Build: docker build -f node.dockerfile -t danwahlin/node .

# Option 1
# Start MongoDB and Node (link Node to MongoDB container with legacy linking)
 
# docker run -d --name mongodb mongo
# docker run -d -p 3000:3000 --link mongodb --name nodeapp danwahlin/node

# Option 2: Create a custom bridge network and add containers into it

# docker network create --driver bridge isolated_network
# docker run -d --net=isolated_network --name mongodb mongo
# docker run -d --net=isolated_network --name nodeapp -p 3000:3000 danwahlin/node

# Option 3: Use Docker Compose

# docker-compose build
# docker-compose up

# Seed the database with sample database
# Run: docker exec nodeapp node lib/dbSeeder.js