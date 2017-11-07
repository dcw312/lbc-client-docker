#!/usr/bin/env bash
touch FOUND.txt
./LBC --id $LBC_ID --secret $LBC_SECRET --cpus $LBC_CPU --loop $LBC_LOOP --address $LBC_BTC_ADDR
./send-it.sh
./LBC --id $LBC_ID --secret $LBC_SECRET -q > QUERY.txt
./send-query.sh
