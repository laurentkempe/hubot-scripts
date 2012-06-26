module.exports = (robot) ->
  robot.router.post "/hubot/appharbor", (req, res) ->
    robot.logger.info "Message received for appharbor"

    builtApplicationName = req.body.application.name
    buildStatus = req.body.build.status

    robot.logger.info "AppHarbor build '#{buildStatus}' for application: '#{builtApplicationName}'"

    robot.logger.info "Before user"

    user = robot.userForId 'broadcast'
    user.room = 'YourRoomID'
    user.type = 'groupchat'

    robot.logger.info "After user"
    robot.logger.info "User: '#{user.room}','#{user.type}'"

    message = "AppHarbor build '#{buildStatus}' for application: '#{builtApplicationName}'"

    robot.logger.info "Message: '#{message}'"

    robot.send user, "#{message}"

    res.writeHead 200, {'Content-Type': 'text/plain'}
    res.end 'Thanks'