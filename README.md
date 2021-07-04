# FA26A 21-001 Capstone: Team Most Significant Bits

## Purpose
The purpose of this repository is to document our Docker services stack used in our final network practicum. Most of our services ran and Linux and therefore were easy candidates for Docker Compose. Please feel free to share and adapt this project for your own specific needs.

## Usage
The code ran an managed using [docker-compose](https://docs.docker.com/compose/compose-file/compose-file-v3/) from the root directory. Since we put all of our services into a single Docker Compose file, do NOT simply issue an `docker-compose up -d`. Bring a service up or down should be methodical and intensional. See the Docker Compose CLI [reference guide](https://docs.docker.com/compose/reference/) for more details.

To create/recreate a container instance for a service and run in the back ground, use the up command with the -d flag. Without the -d flag, the services will run in the foreground, which may be useful to catch error messages.
`docker-compose up -d [SERVICE]`
ex) `docker-compose up -d ns1`

To stop a service, use the stop command.

`docker-compose stop [SERVICE]`

ex) `docker-compose stop ns1`

Building an image will occur automatically when a serivice does not have an image to run. Some services have static configuration that get copied into the image during the build. If you were to edit said configs, you would need to rebuild the image in order to see the changes.

`docker-compose build [SERVICE]`

ex) `docker-compose build ns1`

For more information on using docker-compose, follow the link above or use the cli help options for a particular command.
`docker-compose --help`
`docker-compose up --help`
`docker-compose stop --help`
`docker-compose build --help`

## Important Files
### [env_file](https://github.com/notarobot767/fa26a-docker-services/blob/main/.env)
Variables used on in [docker-compose.yml](https://github.com/notarobot767/fa26a-docker-services/blob/main/docker-compose.yml). Edit these variables for binding IP/ports and directories.

### [docker-compose.yml](https://github.com/notarobot767/fa26a-docker-services/blob/main/docker-compose.yml)
The main definition for all services. Edit settings for changing IP, ports, memory usage, volume mounts. See the Docker Compose file [reference guide](https://docs.docker.com/compose/compose-file/compose-file-v3/) for more details.

## Services
### DNS
For name resolution, we used the well known standard [BIND 9](https://bind9.readthedocs.io/en/v9_16_18/) software to run our primary (ns1) and secondary (ns2) dns servers. BIND 9 is controlled with the [named](https://linux.die.net/man/8/named) daemon and listens on both TCP/UDP port 53. See our [Dockerfile](https://github.com/notarobot767/fa26a-docker-services/blob/main/app/bind9/Dockerfile) for how we built the image.

### NTP
For time synchronization, we used [Chrony](https://chrony.tuxfamily.org/doc/devel/chrony.conf.html) to run our primary (ntp-a) and secondary (ntp-b) time servers. We also created a ntp pool by issueing two A reconds for pool.ntp.tld. Chrony is controlled by the [chronyd](https://chrony.tuxfamily.org/doc/4.1/chronyd.html) daemon and listens on UDP port 123. Two useful command to verify Chrony is operationg using the [chronyc](https://chrony.tuxfamily.org/doc/4.1/chronyc.html) cli are: `chronyc sources` and `chroncy tracking`. See our [Dockerfile](https://github.com/notarobot767/fa26a-docker-services/blob/main/app/ntp/Dockerfile) for how we build the image.