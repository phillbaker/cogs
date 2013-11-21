class Coginator.Routers.GearsRouter extends Backbone.Router

  routes:
    "": "showGear"
    "gears/:id": "showGear"

  initialize: ->
    Backbone.history.start()

  showGear: (gearId) ->
    if gearId
      gear = new Coginator.Models.Gear(id: gearId)
      collection = new Coginator.Collections.Gears([gear])
      gear.fetch(
        success: (model) ->
          view = new Coginator.Views.GearView(
            el: $('#cog-output')
            model: model
            width: 960
            height: 500
          )
      )
    else
      view = new Coginator.Views.GearView(
        el: $('#cog-output')
      )
