class BackboneBlog.Views.ArticlesIndex extends Backbone.View
  template: JST['articles/index']
  
  events:
    'click .js-new-article': 'newArticle'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @add, this)
    @collection.on('remove', @render, this)
    
  render: ->
    $(@el).html(@template())
    _.each @collection.models, (model)=> 
      view = new BackboneBlog.Views.ArticlesIndexItem(model: model)
      @$('section').append(view.render().el)
    this
    
  add: (model)->
    view = new BackboneBlog.Views.ArticlesIndexItem(model: model)
    @$('section').append(view.render().el)
        
  newArticle: ->
    UrlHelper.navigate_to_new_model('articles')