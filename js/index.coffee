define ["app", "providers/stops"], (App, StopsProvider) ->
  stops = new StopsProvider
    swlat: 51.50874245880334,
    swlng: -0.17578125,
    nelat: 51.536085601784755,
    nelng: -0.1318359375

  stops.fetch()
  .then ->
    stops.each (value) ->
      console.log value.toJSON()
