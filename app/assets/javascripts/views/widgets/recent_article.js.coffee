class BackboneBlog.Views.RecentArticle extends Backbone.View
  template: JST['widgets/recent_article']
  
  el: '#sidebar'
  
  initialize: ->
    @model.on 'change', @render, this
    
  render: ->
    $(@el).html(@template(article: @model))
    this