# FA26A 21-001 Capstone: Team Most Significant Bits

## Purpose
The purpose of this repository is to document our Docker services stack used in our final network practicum. Most of our services ran and Linux and therefore were easy candidates for Docker Compose. Please feel free to share and adapt this project for your own specific needs.

## Usage
The code ran an managed using [docker-compose](https://docs.docker.com/compose/compose-file/compose-file-v3/) from the root directory. Since we put all of our services into a single Docker Compose file, do not simply issue an `docker-compose up -d`. Bring a service up or down should be methodical and intensional. See the Docker Compose CLI [reference guide](https://docs.docker.com/compose/reference/) for more details.

`docker-compose up -d [SERVICE]`

ex) `docker-compose up -d ntp-a`

## Important Files
### [env_file](https://github.com/notarobot767/fa26a-docker-services/blob/main/.env)
Variables used on in [docker-compose.yml](https://github.com/notarobot767/fa26a-docker-services/blob/main/docker-compose.yml). Edit these variables for binding IP/ports and directories.

### [docker-compose.yml](https://github.com/notarobot767/fa26a-docker-services/blob/main/docker-compose.yml)
The main definition for all services. Edit settings for changing IP, ports, memory usage, volume mounts. See the Docker Compose file [reference guide](https://docs.docker.com/compose/compose-file/compose-file-v3/) for more details.