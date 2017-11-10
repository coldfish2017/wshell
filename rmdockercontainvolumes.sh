#!/bin/bash
service docker stop && echo "service docker stopped" && rm -rf /var/lib/docker/containers/* && rm -rf /var/lib/docker/volumes/* && echo "delete docker's containers and volumes successfully" && service docker start



