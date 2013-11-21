class Coginator.Views.GearView extends Backbone.View
  controlTemplate: JST["backbone/templates/gear_control"]
  emptyTemplate: JST["backbone/templates/empty_gear_view"]

  events:
    "change #gear-teeth": "changedTeeth"
    "change #gear-radius": "changedRadius"
    "click .control .btn": (e) -> e.preventDefault()
    "click #gear-save": "save"
    "click #gear-new": "new"

  initialize: (options) ->
    @options ||= options
    @render()

  render: ->
    @$el.html(@controlTemplate()) # Probably don't need to re-render this each time

    if @model
      @renderGear(@$el.attr('id'), @model, @options.width, @options.height)
      @$el.find('#gear-teeth').val(@model.get('teeth'))
      @$el.find('#gear-radius').val(@model.get('radius'))

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

  new: ->
    Backbone.history.navigate("#", { trigger: true })

  save: ->
    wasNew = true if @model.isNew()
    # if the model isn't saved to the server yet, save it and set the hash equal to it's new id
    # else, we've already saved it and just save it to the server
    @model.save(@model.toJSON(),
      success: (model, response, options) ->
        console.log "/gears/#{model.id}"
        Backbone.history.navigate("#/gears/#{model.id}", { trigger: true, replace: true })
    )


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

