#!/bin/bash

echo ECS_CLUSTER = production >> /etc/ecs/ecs.config


KEY_PATH = ~/.ssh/blog
EMAIL = xyz@blog.com

ssh-keygen -t rsa -b 4096 -f  $KEY_PATH -c $EMAIL

chmod 600 $KEY_PATH
ssh-add $KEY_PATH
cat ${KEY_PATH}.pub
