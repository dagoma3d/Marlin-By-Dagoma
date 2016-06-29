#!/bin/bash
pwd=$(pwd)
echo $pwd
docker run --name dockerMarlin -a stdin -a stdout -v $pwd:/opt/dist -i -t ubuntu /bin/bash
docker rm dockerMarlin
