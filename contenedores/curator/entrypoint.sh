#!/bin/sh

# https://github.com/krallin/tini/blob/master/README.md#subreaping
/sbin/tini -s -- /usr/sbin/crond -f -d 8 -l 8
