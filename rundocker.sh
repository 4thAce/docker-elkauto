#!/bin/sh
export ES_PERSIST="-v /mnt/elasticsearch:/var/lib/elasticsearch"
docker run -d -h elk --name elk -p 80:80 -p 3333:3333 -p 9200:9200 ${ES_PERSIST} 4thace/elk /elk_start.sh
