define ["backbone.marionette", "models/stop", "hbs!views/templates/empty"], (Marionette, StopModel, template) ->
  class extends Marionette.ItemView
    model: StopModel

    template: template

    onBeforeDestroy: ->
      @options.marker.setMap null

    onRender: ->
      @options.marker = @getMarker()

    delegateMarkerEvents: (marker) ->

    getMarker: ->
      marker = new google.maps.Marker @markerOptions()
      @delegateMarkerEvents marker
      marker

    markerOptions: ->
      code: @model.get "id"
      direction: @model.get "direction"
      icon: "images/line.png"
      map: @options.map
      position: new google.maps.LatLng (@model.get "lat"), @model.get "lng"
      title: @model.get "name"
      toward: @model.get "towards"
      stopIndicator: @model.get "stopIndicator"
