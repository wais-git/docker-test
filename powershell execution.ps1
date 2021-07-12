cd "C:\Users\jfahey-gilmour\OneDrive - WESTERN AUSTRALIAN INSTITUTE OF SPORT INCORPORATED\Documents\GitHub\docker-test"

docker images
docker containers

# Build image
docker build -t waisdatascience/docker-test .

# Run container from image

docker run -e TZ=Australia/Perth waisdatascience/docker-test

docker run -v ~/Data:/Data waisdatascience/docker-test