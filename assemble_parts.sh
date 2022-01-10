#!/bin/bash

BASE64=""
BASE64_FILE=./result.base64
JSON_PATH=./json
NFT_FIRST_NUM=1
NFT_LAST_NUM=108
NFT_PREFIX="MotleySpider #"

#FIND ORDER FOR ASSEMBLING
for (( i=${NFT_FIRST_NUM}; i<=${NFT_LAST_NUM}; i++ ))
do
    NEXT_NUM=$i
    while [ -n "${NEXT_NUM}" ];
    do
        ORDER+=( ${NEXT_NUM} )
        NEXT_NUM=`cat "${JSON_PATH}/${NFT_PREFIX}${NEXT_NUM}.json" | jq -r '.next' | awk -F '#' '{print $2;}'`
    done

    if [[ ${#ORDER[@]} == ${NFT_LAST_NUM} ]]; then
        break
    fi

    unset ORDER
done

#ASSEMBLING PARTS
for i in ${ORDER[@]}
do
    PART=`cat "${JSON_PATH}/${NFT_PREFIX}${i}.json" | jq -r '.part.base64'`
    BASE64=${BASE64}${PART}
done

echo "${BASE64}" >> ${BASE64_FILE}

#DECODING BASE64 CODE TO IMAGE
echo "${BASE64}" | base64 --decode - >> result.png
