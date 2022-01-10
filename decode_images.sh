#!/bin/bash

JSON_PATH=./json
IMAGE_PATH=./images

mkdir -p ${IMAGE_PATH}

for i in ${JSON_PATH}/*
do
    FILENAME=$(basename "$i")
    FILENAME="${FILENAME%.*}"
    cat "${i}" | jq -r '.image.base64' | base64 --decode - >> "${IMAGE_PATH}/${FILENAME}.png"
done
