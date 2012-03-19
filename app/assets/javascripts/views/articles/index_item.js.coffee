class BackboneBlog.Views.ArticlesIndexItem extends Backbone.View
  template: JST['articles/index_item']
  tagName: 'article'
  
  events:
    'click .js-edit-article': 'editArticle'
    'click .js-show-article': 'showArticle'
    'click .js-destroy-article': 'destroyArticle'
  
  render: ->
    $(@el).html(@template(article: @model))
    this
    
  editArticle: ->
    Backbone.history.navigate("/articles/#{@model.id}/edit", true)
  
  showArticle: ->
    Backbone.history.navigate("/articles/#{@model.id}", true)
  
  destroyArticle: ->
    @model.destroy()
    $(@el).remove()
  