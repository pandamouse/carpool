Carpool.Views.Vehicles ||= {}

class Carpool.Views.Vehicles.IndexView extends Backbone.View
  template: JST["backbone/templates/vehicles/index"]

  initialize: () ->
    @options.vehicles.bind('reset', @addAll)

  addAll: () =>
    @options.vehicles.each(@addOne)

  addOne: (vehicle) =>
    view = new Carpool.Views.Vehicles.VehicleView({model : vehicle})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(vehicles: @options.vehicles.toJSON() ))
    @addAll()

    return this
