room = ""
if(user_type == "admin")
  room = "admin"
else if(user_type == "manager")
  room = "manager"

if(user_type == "admin" || user_type == "manager")
  App.accommodation = App.cable.subscriptions.create { channel: "AccommodationChannel", room: room },
  connected: ->
    console.log("Connected!")
  disconnected: ->
    console.log("Disconnected!")
  received: (data) ->
    console.log(data)
    $('body').css('background-color', 'red')
