#!/bin/sh
#
# Agent Proxy for Deleting Policies.
#
body=`echo $1 | cut -d'=' -f2`
echo Posting $body to http://localhost:9630/
echo curl -H 'content-type: application/json' -d @- -X DELETE http://localhost:9630/
echo $body | curl -H 'content-type: application/json' -d @- -X DELETE http://localhost:9630/
