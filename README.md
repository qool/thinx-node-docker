# thinx-node-docker

Instance of THiNX Remote Device Management NodeJS client [thinx-firmware-js](https://github.com/suculent/thinx-firmware-js) safely enclosed inside a docker image, so the app can run safely as root.

### Dependency

Docker - available at [Docker Store for community](https://store.docker.com/search?type=edition&offering=community)

### Preparations

Configure the ENV variables in `Dockerfile/Kitematic`:

`API_KEY` enter API Key created on [THiNX RTM Console](https://rtm.thinx.cloud)

`OWNER_ID` you can find this in your User Profile on THiNX RTM

`DEVICE_ALIAS` you will find the instance under this name on  Dashboard when it checks in

Update  file `./config.json` accordingly.

```

Create a folder, where the library will store its persistent data:

`mkdir -p ./node-persist`

...and run the container:

`docker run -v $(pwd)/node-persist:/thinx-firmware-js/.node-persist suculent/thinx-node-docker`

```
After changes made in config, you should flush the device cache, before run:

`rm -r ./.node-persist`

### Building the container

```
`docker build -t suculent/thinx-node-docker .`
```

### Using your own docker image

Create new repository at [Docker Hub](https://hub.docker.com) e.g.: qooldev/thinx-docker-tutorial

```
`docker build -t qooldev/thinx-docker-tutorial .`

`docker login`

`docker push qooldev/thinx-docker-tutorial`

```

Afterwards, you may want to fork suculent/thinx-firmware-js on github and update links in your dockerFile.

Running your custom thinx-js docker image:

```
`docker run -v $(pwd)/node-persist:/thinx-firmware-js/.node-persist qooldev/thinx-docker-tutorial`

```
