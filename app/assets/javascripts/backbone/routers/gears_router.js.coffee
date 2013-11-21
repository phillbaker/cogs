class Coginator.Routers.GearsRouter extends Backbone.Router

  routes:
    "": "loadDefaultGear"
    "gears/:id": "loadGear"

  initialize: ->
    Backbone.history.start()

  loadDefaultGear: ->
    gear = new Coginator.Models.Gear()
    collection = new Coginator.Collections.Gears([gear])
    @showGear(gear)

  loadGear: (gearId) ->
    gear = new Coginator.Models.Gear(id: gearId)
    collection = new Coginator.Collections.Gears([gear])
    gear.fetch(
      success: (model) =>
        @showGear(model)
    )

  #
  # Helpers
  #

  showGear: (gear) ->
    view = new Coginator.Views.GearView(
      el: $('#coginator')
      model: gear
      width: 960
      height: 500
    )