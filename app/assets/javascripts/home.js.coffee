$ ->
  pusher = new Pusher("7fc9fc814c60767a3825")
  pusherChannel = pusher.subscribe("items-channel")

  $("#blocking-request").on "click", ->
    $.ajax "/items.json",
      success: (data) ->
        console.log data
        $("#output").html("Blocking request Items returned: #{data.length}")

  pusherChannel.bind "items-event", (data) ->
    console.log "items-event", data
    $("#output").html("Background request Items returned: #{data.length}")

  $("#background-request").on "click", =>
    $.ajax "/items/background.json",
      success: =>
        console.log "background success"
