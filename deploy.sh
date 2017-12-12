#!/bin/bash
hugo && rsync -avz --delete -e "ssh -i $HOME/.ssh/server1_alibaba.pem" public root@ruonakoski.fi:/var/www
