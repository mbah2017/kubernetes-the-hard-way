#!/bin/bash

for instance in worker-1 worker-2; do
	scp ca.pem $instance-key.pem $instance.pem $instance:~/
done

