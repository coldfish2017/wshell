#!/bin/bash
myPath=/usr/share/docker_images
if [ ! -x "$myPath" ]; 
then  
 mkdir "$myPath"  
fi  
######num是镜像总数目#########
num=`docker images | wc -l`
#########筛选指定版本镜像数目####################
numz=`docker images|grep haha|wc -l`
#############################各种功能###################################
for((i=2;i<=$num;i++));  
do   
#a是每一个镜像加版本号
a=`docker images | head -n $i|tail -1|awk '{print $1}'`:`docker images | head -n $i|tail -1|awk '{print $2}'`
#b是镜像前面部分不加版本号
b=`docker images | head -n $i|tail -1|awk '{print $1}'`
#c是镜像前面部分截取最后一个字段并连接版本号
c=`docker images | head -n $i|tail -1|awk '{print $1}'|awk -F "/"  '{print $NF}' `-`docker images | head -n $i|tail -1|awk '{print $2}'`
#d是版本号
###################打包docker镜像开启此功能#############################
docker save -o $c.tar $a && echo "$a saved" && mv $c.tar $myPath/$c.tar
#echo $a                        				       #
#echo $b							       #
#####################统一更换镜像版本号开启此功能#######################
#docker tag $a $b:haha
done  								       
