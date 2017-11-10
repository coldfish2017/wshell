#!/bin/bash
dir=/tmp
for file in $dir/*
do
echo $file
docker load -i $file.tar
done
