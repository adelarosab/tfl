define ["underscore", "backbone.marionette"], (_, Marionette) ->
  class extends Marionette.Object
    events:
      "childview:line": (view, routes) ->
        _.each routes, (value) ->
          console.log value.id
        filter = (rvalue) ->
          console.log rvalue.id
          _.findWhere routes, {id: rvalue.id}

        @view.collection.each (value) ->
          if (_.find (value.get "routes"), filter)
            value.set "status", 2
      "childview:resetIcons": "resetIcons"
      load: "getMarkers"
      refresh: "getMarkers"
      resetIcons: "resetIcons"

    initialize: (options) ->
      @view = options?.view
      Marionette.bindEntityEvents this, @view, @events

    getMarkers: ->
      keys = ["swlat", "swlng", "nelat", "nelng"]
      position = _.object keys, @view.options.map.getBounds().toUrlValue().split ","

      @view.collection.resolveUrl(position)
      @resetIcons()
      @view.collection.fetch().then =>
        console.log @view.collection.length, @view.children

    resetIcons: ->
      @view.collection.each (value) ->
        value.set "status", 1
