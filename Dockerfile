FROM mhart/alpine-node

MAINTAINER Luke Sigler <lukesigler@outlook.com>

RUN apk update && \
    apk add bash curl && \
    rm -rf /tmp/* /var/cache/apk/*

RUN curl -L https://github.com/aelsabbahy/goss/releases/download/v0.2.1/goss-linux-amd64 > /usr/local/bin/goss && chmod +rx /usr/local/bin/goss

RUN mkdir /tmp/goss

RUN npm install -g coffee-script yo generator-hubot && adduser hubot -S

USER hubot

WORKDIR /home/hubot

ENV DEV=false HUBOT_LOG_LEVEL=debug BOT_NAME=default BOT_OWNER=default BOT_DESC=default HUBOT_SLACK_TOKEN=default EXTERNAL_SCRIPTS=hubot-diagnostics,hubot-help,hubot-rules

RUN yo hubot --owner="$BOT_OWNER" --name="$BOT_NAME" --description="$BOT_DESC" --defaults && npm install hubot-slack

CMD node -e "console.log(JSON.stringify('$EXTERNAL_SCRIPTS'.split(',')))" > external-scripts.json && \
	npm install $(node -e "console.log('$EXTERNAL_SCRIPTS'.split(',').join(' '))")  && \ 
    bin/hubot -n $BOT_NAME -a slack