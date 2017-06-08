App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    console.log('[Appearance_Channel] Connected.')
    @appear()

  disconnected: ->
    console.log('[Appearance_Channel] Disconnected.')

  rejected: ->
    console.log('[Appearance_Channel] Rejected.')

  received: (data) ->
    console.log('[Appearance_Channel] message recieved', data)

  appear: ->
    console.log('[Appearance_Channel] appear.')
    data = 'hello'
    @perform("appear", appearing_on: data)

  away: ->
    console.log('[Appearance_Channel] away.')
    @perform("away")


  buttonSelector = "[data-behavior~=appear_away]"

  install: ->
    $(document).on "page:change.appearance", =>
      @appear()

    $(document).on "click.appearance", buttonSelector, =>
      @away()
      false

    $(buttonSelector).show()

  uninstall: ->
    $(document).off(".appearance")
    $(buttonSelector).hide()
