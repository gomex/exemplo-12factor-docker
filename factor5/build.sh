#!/bin/bash

USER="gomex"
TIMESTAMP=$(date "+%Y.%m.%d-%H.%M")

echo "Construindo a imagem ${USER}/app:${TIMESTAMP}"
docker build -t ${USER}/app:${TIMESTAMP} .

echo "Marcando a tag latest também"
docker tag ${USER}/app:${TIMESTAMP} ${USER}/app:latest

echo "Enviando a imagem para nuvem docker"
docker push ${USER}/app:${TIMESTAMP}
docker push ${USER}/app:latest

export TIMESTAMP
