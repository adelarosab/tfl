define ["underscore", "backbone.marionette"], (_, Marionette) ->
  class extends Marionette.Object
    events:
      load: "getMarkers"
      refresh: "getMarkers"

    initialize: (options) ->
      @view = options?.view
      Marionette.bindEntityEvents this, @view, @events

    getMarkers: ->
      keys = ["swlat", "swlng", "nelat", "nelng"]
      position = _.object keys, @view.options.map.getBounds().toUrlValue().split ","

      @view.collection.resolveUrl(position)
      @view.collection.fetch().then =>
        console.log @view.collection.length, @view.children
