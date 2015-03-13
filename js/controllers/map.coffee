define ["underscore", "backbone.marionette", "views/arrivals"],
  (_, Marionette, ArrivalsView) ->
    class extends Marionette.Object
      events:
        "childview:line": (view, routes) ->
          filter = (rvalue) ->
            _.findWhere routes, {id: rvalue.id}

          @view.collection.each (value) ->
            if (_.find (value.get "routes"), filter)
              value.set "status", 2
        "childview:reset": "reset"
        load: "getMarkers"
        refresh: "getMarkers"
        reset: "reset"
        "childview:select": (view) ->
          @details = new ArrivalsView id: view.model.get "id"
          @details.render()
          view.model.set "status", 4

      initialize: (options) ->
        @view = options?.view
        Marionette.bindEntityEvents this, @view, @events

      getMarkers: ->
        keys = ["swlat", "swlng", "nelat", "nelng"]
        position = _.object keys, @view.options.map.getBounds().toUrlValue().split ","

        @view.collection.resolveUrl(position)
        @reset()
        @view.collection.fetch dataType: "jsonp"

      reset: ->
        @details?.$el?.empty?()
        @details = null
        @view.collection.each (value) ->
          value.set "status", 1
