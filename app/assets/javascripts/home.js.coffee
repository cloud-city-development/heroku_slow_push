delay = (ms, func) -> setTimeout func, ms

$ ->
  pusher = new Pusher("7fc9fc814c60767a3825")
  pusherChannel = pusher.subscribe("items-channel")
  $output = $("#output")

  $("#blocking-request").on "click", =>
    startTime = new Date
    for id in [1..100]
      $.ajax "/items/#{id}.json",
        success: (data) =>
          endTime = new Date
          $("#req#{data.id}").html( "#{endTime - startTime}ms" )

  backgroundStartTime = new Date

  pusherChannel.bind "items-event", (data) =>
    endTime = new Date
    $("#req#{data.id}").html( "#{endTime - backgroundStartTime}ms" )

  $("#background-request").on "click", =>
    for id in [1..100]
      $.ajax "/items/#{id}/background.json"
