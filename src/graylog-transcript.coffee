# Description:
#   Logs all chat messages to Graylog
#
# Dependencies:
#   "node-graylog": ">= 0.1.3"
#
# Configuration:
#   HUBOT_GRAYLOG_TRANSCRIPT_HOST
#   HUBOT_GRAYLOG_TRANSCRIPT_PORT (optional, default: 12201)
#   HUBOT_GRAYLOG_TRANSCRIPT_FACILITY (optional, default: chat)
#   HUBOT_GRAYLOG_TRANSCRIPT_CHUNK_SIZE (optional, default: 1500)
#
# Author:
#   spajus

module.exports = (robot) ->

  gl = require('graylog')

  GLOBAL.graylogHost = process.env.HUBOT_GRAYLOG_TRANSCRIPT_HOST
  GLOBAL.graylogPort = process.env.HUBOT_GRAYLOG_TRANSCRIPT_PORT || '12201'
  GLOBAL.graylogFacility = process.env.HUBOT_GRAYLOG_TRANSCRIPT_FACILITY || 'chat'
  GLOBAL.graylogChunkSize =  process.env.HUBOT_GRAYLOG_TRANSCRIPT_CHUNK_SIZE || '1500'

  robot.hear //, (msg) ->
    room = msg.message.room
    return unless room # Don't log private conversations
    room = room.replace(/@.*/g, '') # Drop @conference.bla bla if it's XMPP room
    author = msg.message.user.name
    gl.log "#{author}: #{msg.message.text}", room: room, author: author
