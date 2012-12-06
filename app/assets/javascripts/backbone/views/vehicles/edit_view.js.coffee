Carpool.Views.Vehicles ||= {}

class Carpool.Views.Vehicles.EditView extends Backbone.View
  template : JST["backbone/templates/vehicles/edit"]

  events :
    "submit #edit-vehicle" : "update"
    "change #child_seat" : "setChildSeat"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (vehicle) =>
        @model = vehicle
        window.location.hash = "/#{@model.id}"
    )

  setChildSeat: (e) ->
    @model.set
      'child_seat': $('#child_seat').is(':checked')

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
