define ["collections/arrivals"], (ArrivalsCollection) ->
  class extends StopsCollection
    url: "http://countdown.tfl.gov.uk/stopBoard/:id"

    initialize: (options) ->
      param = ///:(\w+)///g

      @url = @url.replace param, (match, key) ->
        return options?[key]

    parse: (data) ->
      return data?.arrivals