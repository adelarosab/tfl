define ["collections/arrivals"], (ArrivalsCollection) ->
  class extends ArrivalsCollection
#    urlRegexp: "http://countdown.tfl.gov.uk/stopBoard/:id"
    urlRegexp: "http://digitaslbi-id-test.herokuapp.com/bus-stops/:id"

    parse: (data) ->
      return data?.arrivals

    resolveUrl: (options) ->
      console.log options
      param = ///:(\w+)///g

      @url = @urlRegexp.replace param, (match, key) =>
        options?[key]