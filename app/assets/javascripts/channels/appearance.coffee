App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    console.log('AppearanceChannel Connected.')
    @appear()

  disconnected: ->
    console.log('AppearanceChannel Disconnected.')

  rejected: ->
    console.log('AppearanceChannel Rejected.')

  received: (data) ->
    console.log('message recieved', data)

  appear: ->
    data = 'hello'
    @perform("appear", appearing_on: data)

  away: ->
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
