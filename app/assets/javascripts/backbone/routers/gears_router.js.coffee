class Coginator.Routers.GearsRouter extends Backbone.Router

  routes:
    "": "showGear"
    "gears/:id": "showGear"

  initialize: ->
    Backbone.history.start()

  showGear: (gearId) ->
    gear = Coginator.Models.Gear.fetch(id: gearId) if gearId

    view = new Coginator.Views.CogOutput(
      el: $('#cog-output')
      model: gear
    )
