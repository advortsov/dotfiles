#!/bin/bash

HOST='https://api-dev.n2.org'
PHONE="+79521001847"

OTP_KEY=$(curl -s --location --request POST ''$HOST'/pub/auth/otp/generate' \
--header 'Accept-Language: es-US' \
--header 'X-Platform: IOS' \
--header 'X-App-Version: 1.9.1' \
--header 'Content-Type: application/json' \
--data-raw '{
    "phoneNumber": "'$PHONE'"
}' | jq .otpKey)

echo $OTP_KEY
TOKEN=$(curl -s --location --request POST ''$HOST'/pub/auth/signin' \
--header 'Content-Type: application/json' \
--data-raw '{
    "phoneNumber": "'$PHONE'",
    "otp": "111111", 
    "otpKey": '$OTP_KEY' 
}') 
RES=$(echo $TOKEN | jq .accessToken | cut -d'"' -f 2)
echo $RES
echo $RES | xclip -selection c
