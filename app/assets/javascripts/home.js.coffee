$ ->
  pusher = new Pusher("7fc9fc814c60767a3825")
  pusherChannel = pusher.subscribe("items-channel")
  $output = $("#output")

  $("#blocking-request").on "click", =>
    $output.empty()
    startTime = new Date
    for id in [1..100]
      $.ajax "/items/#{id}.json",
        success: (data) =>
          endTime = new Date
          $output.append( $("<p>#{data.name} returned after #{endTime - startTime}ms</p>") )

  backgroundStartTime = new Date

  pusherChannel.bind "items-event", (data) =>
    endTime = new Date
    $output.append( $("<p>#{data.name} returned after #{endTime - backgroundStartTime}ms</p>") )

  $("#background-request").on "click", =>
    $output.empty()
    for id in [1..100]
      $.ajax "/items/#{id}/background.json"
