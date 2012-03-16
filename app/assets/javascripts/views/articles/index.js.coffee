class BackboneBlog.Views.ArticlesIndex extends Backbone.View
  template: JST['articles/index']

  initialize: ->
    @collection.on('reset', @render, this)
    
  render: ->
    $(@el).html(@template())
    _.each @collection.models, (model)=> 
      view = new BackboneBlog.Views.ArticlesIndexItem(model: model)
      @$('ul').append(view.render().el)
    this