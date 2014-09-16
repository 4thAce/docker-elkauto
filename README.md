docker-elkauto
==============

Docker ELK container based on the one by cyberabis/docker-elkauto


Trying out this container
========================= 

Use “sudo” before commands if required.

Make sure docker is installed.

Run: docker pull 4thace/elk

Run: docker run -d -h elk --name elk -p 80:80 -p 3333:3333 -p 3334:3334 -p 9200:9200 4thace/elk /elk_start.sh

To redirect the Elasticsearch data to a local volume do something 
like this

export ES_DATA="-v /mnt/elasticsearch:/var/lib/elasticsearch"
docker run -d -h elk --name elk -p 80:80 -p 3333:3333 -p 3334:3334 -p 9200:9200 ${ES_DATA} 4thace/elk /elk_start.sh

To run in interactive mode for debugging

docker run -t -i -p 80:80 -p 3333:3333 -p 3334:3334 -p 9200:9200 ${ES_DATA} 4thace/elk /bin/bash

Sending data to ELK
===================

Logstash is listening in TCP port 3333 & 3334. You can stream data like:

For text:
cat YOUR_FILE | nc DOCKER_IP 3333

For JSON:
cat YOUR_FILE | nc DOCKER_IP 3334

For rsyslog information include an entry in /etc/rsyslog.d with a line like

*.*    @@IP-OF-DOCKER-HOST:3333

Viewing data
============

Kibana runs at port 80. Just point your browser to your Docker IP.
