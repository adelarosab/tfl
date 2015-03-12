define ["backbone.marionette", "models/stop", "hbs!views/templates/empty"], (Marionette, StopModel, template) ->
  STATUS =
    default: 1
    line: 2
    selected: 4

  class extends Marionette.ItemView
    model: StopModel

    modelEvents:
      "change:status": (model, value) ->
        @options.marker.setIcon switch value
          when STATUS.line then "images/line.png"
          when STATUS.selected then "images/selected.png"
          else "images/default.png"
    template: template

    onBeforeDestroy: ->
      @options.marker.setMap null

    onRender: ->
      @options.marker = @getMarker()

    delegateMarkerEvents: (marker) ->
      google.maps.event.addListener marker, "click", =>
        @trigger "resetIcons"
        @trigger "line", @model.get "routes"
        @model.set "status", STATUS.selected

    getMarker: ->
      marker = new google.maps.Marker @markerOptions()
      @delegateMarkerEvents marker
      marker

    markerOptions: ->
      code: @model.get "id"
      direction: @model.get "direction"
      icon: "images/default.png"
      map: @options.map
      position: new google.maps.LatLng (@model.get "lat"), @model.get "lng"
      title: @model.get "name"
      toward: @model.get "towards"
      stopIndicator: @model.get "stopIndicator"
