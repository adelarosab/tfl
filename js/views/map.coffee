define ["backbone.marionette", "collections/stops", "models/map"],
  (Marionette, StopsCollection, MapModel) ->
    class extends Marionette.CompositeView
      collection: StopsCollection
      model: MapModel

      tagName: "figure",
