#!/bin/sh

echo '$1: API Tocken: '$1
echo '$2: Enter your Question: '$2

echo "\nInput": $1
echo "\nOutput:" 

curl=`cat <<EOS
curl https://api.openai.com/v1/completions 2>/dev/null \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $1" \
  -d '{
  "model": "text-davinci-003",
  "prompt": "<!-- $2 -->\n<!DOCTYPE html>",
  "max_tokens": 4000

}' \
--insecure | jq '.choices[]'.text > index.html
EOS`

eval ${curl}
