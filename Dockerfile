# chromium arm64 version solution: https://github.com/puppeteer/puppeteer/issues/7740#issuecomment-1833202428
# puppeteer version: ~21.5.2
# chromium version: 119.0.6045.105 (https://pptr.dev/chromium-support)
# playwright arm64 chromium build for chromium version 119.0.6045.105: r1088 (https://github.com/microsoft/playwright/commit/38115d121bd330b596a1fde2c81bbc2930783f86)

FROM node:20-slim

LABEL org.opencontainers.image.authors="CanardConfit"
LABEL org.opencontainers.image.source="https://github.com/CanardConfit/puppeteer-docker"
LABEL org.opencontainers.image.description="A simple docker image to run Puppeteer under arm64 architecture."

RUN apt-get update \
    && apt-get install --no-install-recommends -y wget unzip fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-khmeros \
        fonts-kacst fonts-freefont-ttf libxss1 dbus dbus-x11 \
    && service dbus start \
    && groupadd -r pptruser \
    && useradd -rm -g pptruser -G audio,video pptruser

RUN apt-get install --no-install-recommends --yes ca-certificates fonts-liberation gconf-service libasound2 libatk-bridge2.0-0 libatk1.0-0 \
    libc6 libcairo2 libcups2 libdbus-1-3 libdrm2 libexpat1 libfontconfig1 libgbm1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 \
    libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 \
    libxfixes3 libxi6 libxrandr2 libxrender1 libxshmfence1 libxss1 libxtst6 lsb-release wget xdg-utils

RUN wget -q --show-progress 'https://playwright.azureedge.net/builds/chromium/1088/chromium-linux-arm64.zip' -O chromium-linux-arm64.zip
RUN unzip chromium-linux-arm64.zip
RUN rm -f ./chromium-linux-arm64.zip

ENV DBUS_SESSION_BUS_ADDRESS autolaunch:
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV CHROME_PATH=/chrome-linux/chrome
ENV PUPPETEER_EXECUTABLE_PATH=/chrome-linux/chrome

USER pptruser

WORKDIR /home/pptruser

CMD ["google-chrome-stable"]
