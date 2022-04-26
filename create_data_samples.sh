#!/bin/bash
# simple loop for creating pseudo random data for prometheus pushgateway

n=1
while [[ $n -lt 21 ]]; do
    echo "$n run..."
    echo "mymetric $(( $RANDOM % 35 + 10 ))" | curl --data-binary @- http://164.90.165.207:8084/metrics/job/my-temperature
    echo "mymetric $(( $RANDOM % 35 ))" | curl --data-binary @- http://164.90.165.207:8084/metrics/job/my-humidity
    n=$((n+1))
    sleep 15
done
