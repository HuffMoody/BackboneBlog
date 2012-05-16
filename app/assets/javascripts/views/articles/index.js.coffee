class BackboneBlog.Views.ArticlesIndex extends Backbone.View
  template: JST['articles/index']
  
  events:
    'click .js-new-article': 'newArticle'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @newArticleItem, this)
    
  render: ->
    $(@el).html(@template())
    _(@collection.models).each (model)=> 
      @newArticleItem(model)
    this
    
  newArticle: ->
    UrlHelper.navigate_to_new_model('articles')
        
  newArticleItem: (model)->
    view = new BackboneBlog.Views.ArticlesIndexItem(model: model)
    @$('section').append(view.render().el)
