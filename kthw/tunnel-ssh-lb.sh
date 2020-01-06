#!/bin/bash
#This tunnel is to be run from the master node so a tunnel can be opened from the loadbalancer
ssh -L 6443:localhost:6443 192.168.5.30
