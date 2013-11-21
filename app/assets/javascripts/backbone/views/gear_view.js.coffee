class Coginator.Views.GearView extends Backbone.View
  template: JST["backbone/templates/gear_view"]

  initialize: (options) ->
    @options ||= options
    @render()

  render: ->
    if @model
      @$el.empty()
      x = Math.sin(2 * Math.PI / 3)
      y = Math.cos(2 * Math.PI / 3)

      svg = d3.select("##{@$el.attr('id')}")
        .append("svg")
          .attr("width", @options.width)
          .attr("height", @options.height)
        .append("g")
          .attr("transform", "translate(" +  @options.width / 2 + "," +  @options.height / 2 + ")scale(.55)")
        .append("g")

      frame = svg.append("g")
        .datum({radius: Infinity})

      frame.append("g")
        .attr("class", "planet")
        .attr("transform", "translate(" + @model.get('radius') * 3 * x + "," + -@model.get('radius') * 3 * y + ")")
        .datum(
          teeth: @model.get('teeth')
          radius: -@model.get('radius') * 2
        )
      .append("path")
        .attr("d", @model.toPath)
    else
      @$el.html(@template())

