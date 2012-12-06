Carpool.Views.Vehicles ||= {}

class Carpool.Views.Vehicles.VehicleView extends Backbone.View
  template: JST["backbone/templates/vehicles/vehicle"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
