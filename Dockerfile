# chromium arm64 version solution: https://github.com/puppeteer/puppeteer/issues/7740#issuecomment-1833202428
# puppeteer version: ~21.5.2
# chromium version: 119.0.6045.105 (https://pptr.dev/chromium-support)
# playwright arm64 chromium build for chromium version 119.0.6045.105: r1088 (https://github.com/microsoft/playwright/commit/38115d121bd330b596a1fde2c81bbc2930783f86)

FROM node:20-slim

ENV NODE_ENV production

RUN apt-get update && apt-get install wget unzip -y

RUN wget -q --show-progress 'https://playwright.azureedge.net/builds/chromium/1088/chromium-linux-arm64.zip' -O chromium-linux-arm64.zip && \
    unzip chromium-linux-arm64.zip && \
    rm -f ./chromium-linux-arm64.zip

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV CHROME_PATH=/chrome-linux/chrome
ENV PUPPETEER_EXECUTABLE_PATH=/chrome-linux/chrome

RUN groupadd -r pptruser && useradd -rm -g pptruser -G audio,video pptruser

USER pptruser

WORKDIR /home/pptruser

CMD ["google-chrome-stable"]