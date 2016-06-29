#!/bin/bash
pwd=$(pwd)
echo ""
echo "********************"
echo "go to /opt/dist"
echo "********************"
echo ""
docker run --name dockerMarlin -a stdin -a stdout -v $pwd:/opt/dist -i -t ubuntu /bin/bash
docker rm dockerMarlin
