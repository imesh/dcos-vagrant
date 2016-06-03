#!/bin/bash

set -e
vagrant up m1 a1 boot
vagrant ssh a1
cd /vagrant/docker/images
docker load < marathon-lb.v1.2.1.tar.gz
docker load < mysql-5.5.tar
