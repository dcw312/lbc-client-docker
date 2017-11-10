#!/usr/bin/env bash
./LBC --id $LBC_ID --secret $LBC_SECRET --cpus $LBC_CPU --loop $LBC_LOOP
./send-it.sh
