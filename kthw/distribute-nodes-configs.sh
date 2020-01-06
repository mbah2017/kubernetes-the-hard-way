#!/bin/bash
#distributing kubeconfig to nodes

for instance in worker-1 worker-2
do scp $instance.kubeconfig kube-proxy.kubeconfig $instance:~/
done
