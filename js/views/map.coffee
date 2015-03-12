define [
    "backbone.marionette",
    "providers/stops",
    "models/map",
    "views/marker",
    "hbs!views/templates/empty"
  ],
  (Marionette, StopsProvider, MapModel, MarkerView, template) ->
    class extends Marionette.CompositeView
      collection: StopsProvider
      model: MapModel

      childView: MarkerView
      tagName: "figure"
      template: template

      childViewOptions: ->
        map: @options.map

      onRender: ->
        window.map = @options.map = @getMap()


      delegateMapEvents: (map) ->
        google.maps.event.addListenerOnce map, "idle", =>
          @trigger "load"

        refresh = => @trigger "refresh"
        google.maps.event.addListener map, "bounds_changed", refresh
        google.maps.event.addListener map, "resize", refresh
        google.maps.event.addListener map, "zoom_changed", refresh
        google.maps.event.addListener map, "click", =>
          @trigger "resetIcons"

      getMap: ->
        map = new google.maps.Map @el, @mapOptions()
        @delegateMapEvents map
        map

      mapOptions: ->
        center:
          lat: @model.get "lat"
          lng: @model.get "lng"
        keyboardShortcuts: false
        mapTypeControl: false
        minZoom: 11
        streetViewControl: false
        zoom: 15
