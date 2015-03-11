define ["../../bower_components/backbone/backbone"], (Backbone) ->
  class extends Backbone.Model
    defaults:
      lat: 0.00,
      lng: 0.00,
      name: "name",
      stopIndicator: "A"