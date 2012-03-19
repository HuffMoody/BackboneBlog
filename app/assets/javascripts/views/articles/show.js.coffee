class BackboneBlog.Views.ArticleShow extends Backbone.View
  template: JST['articles/show']
  
  events:
    'click .js-back': 'goBack'
  
  initialize: ->
    @model.on 'change', @render, this
  
  render: ->
    $(@el).html(@template(article: @model))
    this
    
  goBack: ->
    Backbone.history.navigate '/articles', true