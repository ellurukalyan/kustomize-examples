#!/bin/sh

curl https://api.openai.com/v1/completions 2>/dev/null \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer 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" \
  -d '{
  "model": "code-davinci-002",
  "prompt": "<!-- Create a web page to create Vm for Azure -->\n<!DOCTYPE html>",
  "temperature": 0,
  "max_tokens": 1256,
  "top_p": 1,
  "frequency_penalty": 0,
  "presence_penalty": 0
}' \
--insecure | jq '.choices[]'.text > index.html
