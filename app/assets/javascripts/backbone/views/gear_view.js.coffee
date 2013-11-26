class Coginator.Views.GearView extends Backbone.View
  controlTemplate: JST["backbone/templates/gear_control"]
  emptyTemplate: JST["backbone/templates/empty_gear_view"]

  events:
    "change #gear-teeth": "changedTeeth"
    "change #gear-radius": "changedRadius"
    "click .control .btn": (e) -> e.preventDefault()
    "click #gear-save": "save"
    "click #gear-new": "new"
    "change #gear-second": "changeCompanionGear"

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

    this

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
    @model.save(@model.toJSON(),
      success: (model, response, options) ->
        console.log "/gears/#{model.id}"
        Backbone.history.navigate("#/gears/#{model.id}", { trigger: true, replace: true })
    )

  changeCompanionGear: (event) ->
    if $(event.target).is(':checked')
      @addCompanionGear()
    else
      @removeCompanionGear()

  addCompanionGear: ->
    # For now just duplicate the current gear, I wonder if that's guaranteed to work in the real world?
    d3.select(".gear-1")
      .attr("transform", "translate(" + (-@model.get('radius') * 2) + "," + "0)")

    @frame.append("g")
      .attr("class", "gear gear-2")
      .attr("transform", "translate(" + (@model.get('radius') * 2) + "," + "0)")
      .datum(
        teeth: @model.get('teeth')
        radius: -@model.get('radius') * 2
      )
    .append("path")
      .attr("d", @model.toPath)

  removeCompanionGear: ->
    d3.select(".gear-2").remove()
    d3.select(".gear-1")
      .attr("transform", "")


  #
  # Helpers
  #

  cleanAndRenderGear: ->
    @$el.find('svg').remove()
    if @$el.find('#gear-second').is(':checked') then @$el.find('#gear-second').attr("checked", false)
    @renderGear(@$el.attr('id'), @model, @options.width, @options.height)

  renderGear: (elId, gear, width, height, isSecond) ->
    xTranslation = if isSecond then gear.get('radius') else 0

    svg = d3.select("##{elId}")
      .append("svg")
        .attr("width", width)
        .attr("height", height)
      .append("g")
        .attr("transform", "translate(" +  (width / 2) + "," +  (height / 2) + ")scale(.5)")
      .append("g")

    @frame = svg.append("g")
      .datum({radius: Infinity})

    @frame.append("g")
      .attr("class", "gear gear-1")
      .datum(
        teeth: gear.get('teeth')
        radius: -gear.get('radius') * 2
      )
    .append("path")
      .attr("d", gear.toPath)

