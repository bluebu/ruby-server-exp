#!/bin/sh

httperf --server localhost --port 8080 --uri /cpu --rate 25 --num-conn 50 --num-call 2 --timeout 5