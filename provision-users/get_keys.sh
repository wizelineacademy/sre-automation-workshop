#!/bin/bash

set -e

TF_OUTPUT=$(terraform output -json)

USER_PREFIX=$(echo "$TF_OUTPUT"| jq -r ".users_prefix.value")

get_ids(){
    echo "$TF_OUTPUT"| jq -r ".iam_ids.value[]"
}

get_keys(){
    echo "$TF_OUTPUT"| jq -r ".iam_keys.value[]"|
    while IFS=$'\t' read -r data; do
        decrypted=$(echo $data| base64 --decode | keybase pgp decrypt)
        echo $decrypted
    done
}

ids=( $(get_ids) )
keys=( $(get_keys) )

for ((i=0;i<${#ids[@]};++i)); do
    printf "$USER_PREFIX-%s\n\taws_access_key_id=%s\n\taws_secret_access_key=%s\n" "$i" "${ids[i]}" "${keys[i]}"
done