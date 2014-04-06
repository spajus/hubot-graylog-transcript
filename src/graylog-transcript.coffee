# Description:
#   Logs all chat messages to Graylog
#
# Dependencies:
#   "graylog2": ">= 0.1.2"
#
# Configuration:
#   HUBOT_GRAYLOG_TRANSCRIPT_HOST
#   HUBOT_GRAYLOG_TRANSCRIPT_PORT (optional, default: 12201)
#   HUBOT_GRAYLOG_TRANSCRIPT_FACILITY (optional, default: chat)
#   HUBOT_GRAYLOG_TRANSCRIPT_CHUNK_SIZE (optional, default: 1400)
#
# Author:
#   spajus

module.exports = (robot) ->

  gl = require('graylog2')

  host = process.env.HUBOT_GRAYLOG_TRANSCRIPT_HOST
  port = process.env.HUBOT_GRAYLOG_TRANSCRIPT_PORT || '12201'
  facility = process.env.HUBOT_GRAYLOG_TRANSCRIPT_FACILITY || 'chat'
  chunkSize =  process.env.HUBOT_GRAYLOG_TRANSCRIPT_CHUNK_SIZE || '1400'

  logger = new gl.graylog
    servers: ['host': host, port: port ]
    facility: 'facility'
    bufferSize: chunkSize

  robot.hear //, (msg) ->
    room = msg.message.room
    return unless room # Don't log private conversations
    room = room.replace(/@.*/g, '') # Drop @conference.bla bla if it's XMPP room
    author = msg.message.user.name
    logger.info "#{author}: #{msg.message.text}", room: room, author: author
