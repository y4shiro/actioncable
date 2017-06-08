App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    console.log('[room_channel] connected')
    # Called when the subscription is ready for use on the server

  disconnected: ->
    console.log('[room_channel] disconnected')
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log('[room_channel] message recieved', data)
    $('#messages').append data['message']

  speak: (message) ->
    console.log('[room_channel] message spoke')
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()
