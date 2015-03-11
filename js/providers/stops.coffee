define ["collections/stops"], (StopsCollection) ->
  class extends StopsCollection
    url: "http://countdown.tfl.gov.uk/markers/swLat/:swlat/swLng/:swlng/neLat/:nelat/neLng/:nelng/"

    initialize: (options) ->
      param = ///:(\w+)///g

      @url = @url.replace param, (match, key) ->
        return options?[key]

    parse: (data) ->
      return data?.markers