class BackboneBlog.Routers.Articles extends Backbone.Router
  routes:
    '': 'index'
    'articles': 'index'
    'articles/new': 'new'
    'articles/:id': 'show'
    'articles/:id/edit': 'edit'
    
  index: ->
    collection = new BackboneBlog.Collections.Articles()
    collection.fetch()
    view = new BackboneBlog.Views.ArticlesIndex(collection: collection)
    @transition(view.render().el)
    
  show: (id)->
    model = new BackboneBlog.Models.Article(id: id)
    model.fetch()
    view = new BackboneBlog.Views.ArticleShow(model: model)
    @transition(view.render().el)
    
  edit: (id)->    
    model = new BackboneBlog.Models.Article(id: id)
    model.fetch()
    view = new BackboneBlog.Views.ArticleEdit(model: model)
    @transition(view.render().el)

  new: ->
    model = new BackboneBlog.Models.Article()
    view = new BackboneBlog.Views.ArticleNew(model: model)
    @transition(view.render().el)
    
  transition: (el)->
    $('#content').html(el)