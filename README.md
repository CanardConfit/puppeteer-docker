# Puppeteer Docker for ARM64

## Introduction
This project provides a Docker image tailored for running Puppeteer on arm64 architecture, facilitating web automation tasks such as web scraping, automated testing of web pages, and screenshot capture of web pages on arm64 platforms.

### Table of Contents
- [Introduction](#Introduction)
- [Installation](#Installation)
- [Usage](#Usage)
- [Features](#Features)
- [Dependencies](#Dependencies)
- [Building the Docker Image](#Building_the_Docker_Image)
- [Contributors](#Contributors)
- [License](#License)

## Installation

The Docker image can be pulled from Docker Hub, here (ghcr.io) or Quay.io:

```sh
# Docker Hub
docker pull canardconfit/puppeteer-docker

# ghcr.io
docker pull ghcr.io/canardconfit/puppeteer-docker

# Quay.io
docker pull quay.io/canardconfit/puppeteer-docker
```

## Usage

You can use this image as a base image, or directly to run something. It was designed to do both.

Check out my project [is-academia-bot](https://github.com/CanardConfit/is-academia-bot) for an example of a base image.

## Features

- Pre-configured environment for Puppeteer on arm64 architecture.
- Includes version of Puppeteer and compatible Chromium versions.

## Dependencies

- Docker installed on your system.
- ARM64 architecture hardware.

## Building the Docker Image

You can build the Docker image from the Dockerfile if modifications are needed or if you prefer to build it locally:

> Please note that you must be on an arm64 machine or on a docker builder under arm64!

```sh
# If your host is under arm64
docker build -t your_custom_name/puppeteer-docker .

# If you are on amd64 for example, and you want to build
docker buildx build -t your_custom_name/puppeteer-docker:latest --platform linux/arm64 -- .
```

## Contributors

To contribute to this project, please fork the repository and submit a pull request.

## License

[Apache 2.0 License](./LICENSE)