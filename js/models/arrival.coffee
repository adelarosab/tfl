define ["backbone"], (Backbone) ->
  class extends Backbone.Model
    defaults:
      destination: "destination",
      routeName: "name",
      scheduledTime: "00:00"