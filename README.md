# Hubot Graylog Transcript

Logs all chatroom conversations to Graylog.

## Installation

Install NPM package:

```
npm install --save hubot-graylog-transcript
```

Add `hubot-graylog-transcript` to `external-scripts.json`:

```
[<...>, "hubot-graylog-transcript"]
```

Configure Hubot via environmental variables:

```
# Required
export HUBOT_GRAYLOG_TRANSCRIPT_HOST="graylog.your.org"

# Optional (default values)
export HUBOT_GRAYLOG_TRANSCRIPT_PORT=12201
export HUBOT_GRAYLOG_TRANSCRIPT_FACILITY="chat"
export HUBOT_GRAYLOG_TRANSCRIPT_CHUNK_SIZE=1500
```

## Known Issues

Hubot will not log itself.


