define [
    "underscore",
    "backbone.marionette",
    "providers/arrivals",
    "views/arrival",
    "hbs!views/templates/arrivals"
  ],
  (_, Marionette, ArrivalsProvider, ArrivalView, template) ->
    class extends Marionette.CompositeView
      collectionEvents:
        "sync": ->
          fetch = =>
            @collection.fetch dataType: "jsonp"
          _.delay fetch, 15000

      el: "aside"
      template: template

      childView: ArrivalView
      childViewContainer: "tbody"

      initialize: (options) ->
        @collection = new ArrivalsProvider
        @collection.resolveUrl options

      onRender: ->
        @collection.fetch dataType: "jsonp"