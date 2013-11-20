class Coginator.Models.Gear extends Backbone.Model
  defaults:
    teethCount: 5
    toothSlices: 5
    depth: 0.1
    tolerance: 0.001

  initialize: () ->
    @teethLoc = []
    @cpitch = self.perimeter() / teethCount


class Coginator.Collections.Gears extends Backbone.Collection
  model: Coginator.Models.Gear
  url: '/gears'