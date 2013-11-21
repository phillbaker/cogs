class Coginator.Views.GearView extends Backbone.View
  controlTemplate: JST["backbone/templates/gear_control"]
  emptyTemplate: JST["backbone/templates/empty_gear_view"]

  events:
    "change #gear-teeth": "changedTeeth"
    "change #gear-radius": "changedRadius"

  initialize: (options) ->
    @options ||= options
    @render()

  render: ->
    @$el.html(@controlTemplate()) # Probably don't need to re-render this each time

    if @model
      @renderGear(@$el.attr('id'), @model, @options.width, @options.height)

    else
      @$el.append(@emptyTemplate())

  changedTeeth: (event) ->
    newTeeth = $(event.target).val()
    @model.set('teeth', newTeeth)

    @cleanAndRenderGear()

  changedRadius: (event) ->
    newRadius = $(event.target).val()
    @model.set('radius', newRadius)
    @cleanAndRenderGear()

  # Helpers
  cleanAndRenderGear: ->
    @$el.find('svg').remove()
    @renderGear(@$el.attr('id'), @model, @options.width, @options.height)

  renderGear: (elId, gear, width, height) ->
    x = Math.sin(2 * Math.PI / 3)
    y = Math.cos(2 * Math.PI / 3)

    svg = d3.select("##{elId}")
      .append("svg")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" +  width / 2 + "," +  height / 2 + ")scale(.55)")
      .append("g")

    frame = svg.append("g")
      .datum({radius: Infinity})

    frame.append("g")
      .attr("class", "gear")
      .datum(
        teeth: gear.get('teeth')
        radius: -gear.get('radius') * 2
      )
    .append("path")
      .attr("d", gear.toPath)

