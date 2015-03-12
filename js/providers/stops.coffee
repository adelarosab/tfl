define ["collections/stops"], (StopsCollection) ->
  class extends StopsCollection
    urlRegexp: "http://countdown.tfl.gov.uk/markers/swLat/:swlat/swLng/:swlng/neLat/:nelat/neLng/:nelng/"

    parse: (data) ->
      return data?.markers

    resolveUrl: (options) ->
      param = ///:(\w+)///g
      @url = @urlRegexp.replace param, (match, key) =>
        options?[key]