# Puppeteer Docker for ARM64

![Docker Pulls](https://img.shields.io/docker/pulls/canardconfit/puppeteer-docker)
![GitHub Release](https://img.shields.io/github/v/release/CanardConfit/puppeteer-docker)
![GitHub Repo stars](https://img.shields.io/github/stars/CanardConfit/puppeteer-docker)

## Introduction

This project provides a Docker image tailored for running Puppeteer on arm64 architecture, facilitating web automation tasks such as web scraping, automated testing of web pages, and screenshot capture of web pages on arm64 platforms.

This project was born from this message: https://github.com/puppeteer/puppeteer/issues/7740#issuecomment-1833202428

## Table of Contents

- [Introduction](#Introduction)
- [Actual version](#actual-version)
- [Installation](#Installation)
- [Usage](#Usage)
- [Features](#Features)
- [Dependencies](#Dependencies)
- [Building the Docker Image](#Building-the-Docker-Image)
- [Contributors](#Contributors)
- [License](#License)

## Actual version

- Puppeteer version: `~23.10.1`
- Chromium version: `132.0.6834.32` (https://pptr.dev/chromium-support)
- Playwright arm64 chromium build for chromium version 132.0.6834.32: `r1151` (https://github.com/microsoft/playwright/commit/dfa24462dbad83c404dca9443e551b8083a4d8b1#diff-ad2f196160da32ffb6ba135ee7e09ab725d445132d72eb35b0e9b92057b08bb8L36)


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
