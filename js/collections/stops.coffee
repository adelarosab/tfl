define ["backbone", "models/stop"], (Backbone, StopModel) ->
  class extends Backbone.Collection
    model: StopModel