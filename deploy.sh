#!/bin/bash
hugo && rsync -avz --delete --exclude=anser -e "ssh -i $HOME/.ssh/server1_alibaba.pem" public root@ruonakoski.fi:/var/www
