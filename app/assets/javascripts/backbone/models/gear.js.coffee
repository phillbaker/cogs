class Coginator.Models.Gear extends Backbone.Model
  defaults:
    teeth: 32
    radius: 80
    #TODO pitch, angle, inner-radius (axel radius) vs. outer radius

  initialize: () ->

  # Circular gear based on https://gist.github.com/mbostock/1353700#file-index-html-L113
  toPath: (data) ->
    n = data.teeth
    r2 = Math.abs(data.radius)
    r0 = r2 - 8
    r1 = r2 + 8
    r3 = 20
    da = Math.PI / n
    a0 = -Math.PI / 2
    i = -1
    path = ["M", r0 * Math.cos(a0), ",", r0 * Math.sin(a0)]

    while (++i < n)
      path.push(
        "A", r0, ",", r0, " 0 0,1 ", r0 * Math.cos(a0 += da), ",", r0 * Math.sin(a0),
        "L", r2 * Math.cos(a0), ",", r2 * Math.sin(a0),
        "L", r1 * Math.cos(a0 += da / 3), ",", r1 * Math.sin(a0),
        "A", r1, ",", r1, " 0 0,1 ", r1 * Math.cos(a0 += da / 3), ",", r1 * Math.sin(a0),
        "L", r2 * Math.cos(a0 += da / 3), ",", r2 * Math.sin(a0),
        "L", r0 * Math.cos(a0), ",", r0 * Math.sin(a0)
      )

    path.push("M0,", -r3, "A", r3, ",", r3, " 0 0,0 0,", r3, "A", r3, ",", r3, " 0 0,0 0,", -r3, "Z")
    path.join("")

class Coginator.Collections.Gears extends Backbone.Collection
  model: Coginator.Models.Gear
  url: '/gears'