#!/bin/sh
export ES_PERSIST="-v /mnt/elasticsearch/data:/elasticsearch/data"
docker run -d -h elk --name elk -p 80:80 -p 3333:3333 -p 3334:3334 -p 9200:9200 ${ES_PERSIST} 4thace/elk /elk_start.sh
