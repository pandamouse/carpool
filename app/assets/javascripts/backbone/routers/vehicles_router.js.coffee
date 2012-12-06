class Carpool.Routers.VehiclesRouter extends Backbone.Router
  initialize: (options) ->
    @vehicles = new Carpool.Collections.VehiclesCollection()
    @vehicles.reset options.vehicles

  routes:
    "/new"      : "newVehicle"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newVehicle: ->
    @view = new Carpool.Views.Vehicles.NewView(collection: @vehicles)
    $("#vehicles").html(@view.render().el)

  index: ->
    @view = new Carpool.Views.Vehicles.IndexView(vehicles: @vehicles)
    $("#vehicles").html(@view.render().el)

  show: (id) ->
    vehicle = @vehicles.get(id)

    @view = new Carpool.Views.Vehicles.ShowView(model: vehicle)
    $("#vehicles").html(@view.render().el)

  edit: (id) ->
    vehicle = @vehicles.get(id)

    @view = new Carpool.Views.Vehicles.EditView(model: vehicle)
    $("#vehicles").html(@view.render().el)
