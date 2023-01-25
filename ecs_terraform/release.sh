#!/bin/bash

ECR_URL= ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com
REPOSITORY=${REPOSITORY}

docker build . -t ${REPOSITORY}:${TAG} --build-arg MESSAGE=${MESSAGE}

docker tag ${REPOSITORY}:${TAG} ${ECR_URL}/${REPOSITORY}:${TAG}

docker push ${ECR_URL}/${REPOSITORY}:${TAG}