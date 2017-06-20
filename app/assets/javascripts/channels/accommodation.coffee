App.accommodation = App.cable.subscriptions.create "AccommodationChannel",
  connected: ->
    console.log("Connected!")
  disconnected: ->
    console.log("Disconnected!")
  received: (data) ->
    console.log(data)
