#!/bin/bash
hugo && rsync -avz --delete --exclude=anser -e "ssh -i $HOME/.ssh/upcloud" public root@ruonakoski.fi:/var/www
