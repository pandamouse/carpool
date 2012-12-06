Carpool.Views.Vehicles ||= {}

class Carpool.Views.Vehicles.ShowView extends Backbone.View
  template: JST["backbone/templates/vehicles/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
