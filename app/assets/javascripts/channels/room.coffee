App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    console.log('room_channel connected')
    # Called when the subscription is ready for use on the server

  disconnected: ->
    console.log('disconnected')
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log('message recieved')
    $('#messages').append data['message']

  speak: (message) ->
    console.log('message spoke')
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
