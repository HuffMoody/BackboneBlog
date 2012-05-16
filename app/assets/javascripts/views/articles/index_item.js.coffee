class BackboneBlog.Views.ArticlesIndexItem extends Backbone.View
  template: JST['articles/index_item']
  tagName: 'article'
  
  events:
    'click .js-edit-article': 'editArticle'
    'click .js-show-article': 'showArticle'
    'click .js-destroy-article': 'destroyArticle'
    
  initialize: ->
    @model.on 'change', @render, this
    @model.on 'remove', @removeArticle, this
  
  render: ->
    $(@el).html(@template(article: @model))
    this
    
  editArticle: (event)->
    UrlHelper.navigate_to_edit_model(@model)
  
  showArticle: ->
    UrlHelper.navigate_to_model(@model)
    
  removeArticle: (model)->
    $(@el).remove()
  
  destroyArticle: (model)->
    @model.destroy()
    @removeArticle
  