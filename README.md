# lbc-client-docker
A Dockerfile for executing the LBC client.
You can build the base from Ubuntu with the lhc-base Dockerfile or pull that from Docker.

You must supply the bloom file independently. See https://bitcointalk.org/index.php?topic=1877935.120

You must also supply a send-it.sh file (which may be empty). It's purpose is to send the FOUND.txt file to a location of choice.

```bash
cp $BLOOM_FILE funds_h160.blf
touch send-it.sh
docker build -t lbc1 .
```

For running, replace the appropriate environmental variables
```bash
docker run -t \
   -e LBC_BTC_ADDR=addr1 \
   -e LBC_CPU=1 \
   -e LBC_ID=id1 \
   -e LBC_LOOP=1 \
   -e LBC_SECRET=secret1 \
   lbc1
```

To run interactively 
```bash
docker run -t \
   -e LBC_BTC_ADDR=addr1 \
   -e LBC_CPU=1 \
   -e LBC_ID=id1 \
   -e LBC_LOOP=1 \
   -e LBC_SECRET=secret1 \
   lbc1 bash
./LBC -h
```