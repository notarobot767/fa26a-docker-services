CREATE DATABASE guac;
CREATE USER 'guacuser'@'%' identified by 'guacuser';
GRANT ALL ON guac.* TO guacuser@'%';
flush privileges;