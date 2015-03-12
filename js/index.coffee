define ["jquery", "app", "controllers/map", "models/map", "views/map", "providers/stops"],
  ($, App, MapController, MapModel, MapView, StopsProvider) ->
    mapView = new MapView
      el: ($ "main")
      model: new MapModel {lat: 51.52, lng: -0}
      collection: new StopsProvider []
    controller = new MapController {view: mapView}
    mapView.render()