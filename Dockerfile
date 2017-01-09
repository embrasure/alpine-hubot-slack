FROM mhart/alpine-node:4.6.0

MAINTAINER Luke Sigler <lukesigler@outlook.com>

RUN apk update && \
    apk add bash curl && \
    rm -rf /tmp/* /var/cache/apk/*

RUN curl -L https://github.com/aelsabbahy/goss/releases/download/v0.2.3/goss-linux-amd64 > /usr/local/bin/goss && chmod +rx /usr/local/bin/goss

RUN mkdir /tmp/goss

RUN npm install -g hubot coffee-script yo generator-hubot && npm cache clear && adduser hubot -S

USER hubot

WORKDIR /home/hubot

ENV DEV=false BOT_NAME=hugh BOT_OWNER=hugh@example.org BOT_DESC="A hubot to love." HUBOT_SLACK_TOKEN=default EXTERNAL_SCRIPTS=hubot-diagnostics,hubot-help,hubot-rules

RUN yo hubot --owner="$BOT_OWNER" --name="$BOT_NAME" --description="$BOT_DESC" --defaults && npm install hubot-slack

VOLUME ["/home/hubot/scripts"]

CMD node -e "console.log(JSON.stringify('$EXTERNAL_SCRIPTS'.split(',')))" > external-scripts.json && \
npm install $(node -e "console.log('$EXTERNAL_SCRIPTS'.split(',').join(' '))") && \
bin/hubot -n $HUBOT_NAME --adapter slack

