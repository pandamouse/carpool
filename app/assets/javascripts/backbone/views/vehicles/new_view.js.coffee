Carpool.Views.Vehicles ||= {}

class Carpool.Views.Vehicles.NewView extends Backbone.View
  template: JST["backbone/templates/vehicles/new"]

  events:
    "submit #new-vehicle": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (vehicle) =>
        @model = vehicle
        window.location.hash = "/#{@model.id}"

      error: (vehicle, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
