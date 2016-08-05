# embrasure/alpine-hubot-slack

master: [![CircleCI](https://circleci.com/gh/embrasure/alpine-hubot-slack/tree/master.svg?style=svg)](https://circleci.com/gh/alpine-hubot-slack/cleanroom/tree/master) 

development: [![CircleCI](https://circleci.com/gh/embrasure/alpine-hubot-slack/tree/development.svg?style=svg)](https://circleci.com/gh/alpine-hubot-slack/cleanroom/tree/development)

[![](https://imagelayers.io/badge/embrasure/alpine-hubot-slack:latest.svg)](https://imagelayers.io/?images=alpine-hubot-slack/cleanroom:latest 'Get your own badge on imagelayers.io') 

[![license](https://img.shields.io/badge/license-MIT-blue.svg?style=plastic)]()

## About alpine-hubot-slack

A minimal hubot with a slack adapter running in alpine. 

## Install

`$ docker pull embrasure/alpine-hubot-slack`

`$ docker run -d -e 'HUBOT_SLACK_TOKEN=your_token' embrasure/alpine-hubot-slack`

### Optional Environment Variables

`DEV` Default "false". 

`LOG_LEVEL` Default "debug". Sets the hubot's log level.

`BOT_NAME` Default "hugh". Sets the hubot's name.

`BOT_OWNER` Default "hugh@example.org". Sets hubot's owner.

`BOT_DESC` Default "A hubot to love." Sets the hubot's description.

`EXTERNAL_SCRIPTS` Default "hubot-diagnostics,hubot-help,hubot-rules". Set the external scripts to include, such as [hubot-redis-brain](https://www.npmjs.com/package/hubot-redis-brain).