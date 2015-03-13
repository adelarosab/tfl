define ["backbone.marionette", "models/arrival", "hbs!views/templates/arrival"],
  (Marionette, ArrivalModel, template) ->
    class extends Marionette.ItemView
      model: ArrivalModel
      tagName: "tr",
      template: template