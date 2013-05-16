$ ->
  $("#background-request").on "click", =>
    channelName = subscribe()
    $.ajax "/items/background.json", data: {channel: channelName}

subscribe = ->
  pusher = new Pusher("7fc9fc814c60767a3825")
  channelName = "item-channel-#{ guid() }"
  pusherChannel = pusher.subscribe(channelName)
  listen(pusherChannel)
  channelName

listen = (channel) ->
  channel.bind "item-event", (data) =>
    $("#background-output").html( JSON.stringify(data) )

# guid generator lifted from http://stackoverflow.com/a/105074/573465
s4 = ->
  Math.floor((1 + Math.random()) * 0x10000).toString(16).substring 1
guid = ->
  s4() + s4() + "-" + s4() + "-" + s4() + "-" + s4() + "-" + s4() + s4() + s4()