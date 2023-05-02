#!/bin/bash

while true
do
    response=$(curl -Is http://john-uick.com)
    if [[ $response != *"HTTP/1.1 2"* && $response != *"HTTP/1.1 3"* ]]; then
        echo "$(date) - Server is down: $response" >> error.log
    fi
    sleep 30
done