class Carpool.Models.Vehicle extends Backbone.Model
  paramRoot: 'vehicle'

  defaults:
    user_id: null
    passenger_space: null
    rego: null
    colour: null
    child_seat: null
    boot: null
    model_id: null

class Carpool.Collections.VehiclesCollection extends Backbone.Collection
  model: Carpool.Models.Vehicle
  url: '/vehicles'
