define ["collections/stops"], (StopsCollection) ->
  class extends StopsCollection
#    urlRegexp: "http://countdown.tfl.gov.uk/markers/swLat/:swlat/swLng/:swlng/neLat/:nelat/neLng/:nelng/"
    urlRegexp: "http://digitaslbi-id-test.herokuapp.com/bus-stops?northEast=:nelat,:nelng&southWest=:swlat,:swlng"

    parse: (data) ->
      return data?.markers

    resolveUrl: (options) ->
      param = ///:(\w+)///g
      @url = @urlRegexp.replace param, (match, key) =>
        options?[key]