Coginator.Views.CogOutput = Backbone.View.extend
  template: JST["backbone/templates/cog_output"]

  initialize: (options) ->
    @options ||= options
    @render()

  render: ->
    @$el.append(@template())