class BackboneBlog.Controllers.ArticlesController extends BackboneBlog.Controllers.ApplicationController
    
  index: ->
    collection = new BackboneBlog.Collections.Articles()
    collection.fetch()
    view = new BackboneBlog.Views.ArticlesIndex(collection: collection)
    @transition(view.render().el)
    
    # Subscribe for notifications
    @subscribe '/model/article/created', (data)->
      model = new BackboneBlog.Models.Article($.parseJSON(data))
      unless collection.get(model.id)
        collection.add(model)
    @subscribe '/model/article/destroyed', (data)->
      model = new BackboneBlog.Models.Article($.parseJSON(data))
      if collection.get(model.id)
        collection.remove(model)
    @subscribe '/model/article/updated', (data)->
      model = new BackboneBlog.Models.Article($.parseJSON(data))
      collection_model = collection.get(model.id)
      if collection_model?
        collection_model.set(model.attributes)

  show: (id)->
    model = new BackboneBlog.Models.Article(id: id)
    model.fetch()
    view = new BackboneBlog.Views.ArticleShow(model: model)
    @transition(view.render().el)
    
    # Subscribe for notifications
    @subscribe '/model/article/updated', (data)->
      model.set(new BackboneBlog.Models.Article($.parseJSON(data)).attributes)

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