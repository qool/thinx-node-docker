# thinx-node-docker

Instance of THiNX Remote Device Management NodeJS client [thinx-firmware-js](https://github.com/suculent/thinx-firmware-js) safely enclosed inside a docker image, so the app can run safely as root.

### Preparations

Until this will be parametrized as ENV variables, enter your THiNX API Key and Owner ID into the config.json file.

Example contents:

```
{
  "thinx": {
    "cloud_url": "thinx.cloud",
    "mqtt_url": "thinx.cloud",
    "owner": "cedc16bb6bb06daaa3ff6d30666d91aacd6e3efbf9abbc151b4dcade59af7c12",
    "api_key": "a854724bc000e030b588370ad8cf31aa95faaf18f33685afa6624c830b920063",
    "device_alias": "thinx-docker-js",
    "app_version": "thinx-app-js:0.1.0:2018-03-22",
    "firmware_version": "thinx-lib-js:0.1.0:2018-03-22",
    "firmware_version_short": "0.1.0",
    "platform": "nodejs",
    "mqtt_port": 1883,
    "api_port": 7443,
    "auto_update": false,
    "forced_update": false    
  }
}


```

Create a folder, where the library will store its persistent data:

`mkdir -p ./node-persist`

...and run the container:

`docker run -v $(pwd)/node-persist:/thinx-firmware-js/.node-persist suculent/thinx-node-docker`

### Building the container

`docker build -t suculent/thinx-node-docker .`
