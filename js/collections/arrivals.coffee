define ["backbone", "models/arrival"], (Backbone, ArrivalModel) ->
  class extends Backbone.Collection
    model: ArrivalModel