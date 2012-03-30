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
    UrlHelper.navigate_to_collection('articles')