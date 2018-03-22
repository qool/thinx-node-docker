# thinx-node-docker

Instance of THiNX Remote Device Management NodeJS client [thinx-firmware-js](https://github.com/suculent/thinx-firmware-js) safely enclosed inside a docker image, so the app can run safely as root.

### Preparations

Configure the ENV variables in Dockerfile/Kitematic:

`API_KEY` enter API Key created on [THiNX RTM Console](https://rtm.thinx.cloud)

`OWNER_ID` you can find this in your User Profile on THiNX RTM

`DEVICE_ALIAS` you will find the instance under this name on  Dashboard when it checks in


```

Create a folder, where the library will store its persistent data:

`mkdir -p ./node-persist`

...and run the container:

`docker run -v $(pwd)/node-persist:/thinx-firmware-js/.node-persist suculent/thinx-node-docker`

### Building the container

`docker build -t suculent/thinx-node-docker .`
