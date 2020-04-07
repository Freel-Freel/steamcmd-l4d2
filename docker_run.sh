#!/bin/bash
echo -e "Start docker L4D2"
docker run  -i -t --rm -p 27016:27016 --name L4D2 l4d2 /bin/bash
