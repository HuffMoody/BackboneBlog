class BackboneBlog.Controllers.ArticlesController extends BackboneBlog.Controllers.ApplicationController
    
  index: ->
    collection = new BackboneBlog.Collections.Articles()
    collection.fetch()
    view = new BackboneBlog.Views.ArticlesIndex(collection: collection)
    @transition(view.render().el)
    
    # Subscribe for notifications
    @single_subscribe '/model/article/created', (data)->
      console.log("index created")
      model = new BackboneBlog.Models.Article(data)
      unless collection.get(model.id)
        collection.add(model)
        
    @single_subscribe '/model/article/destroyed', (data)->
      model = new BackboneBlog.Models.Article(data)
      if collection.get(model.id)
        collection.remove(model)
        
    @single_subscribe '/model/article/updated', (data)->
      updated = new BackboneBlog.Models.Article(data)
      model = collection.get(updated.id)
      if model?
        model.set(updated.attributes)

  show: (id)->
    model = new BackboneBlog.Models.Article(id: id)
    model.fetch()
    view = new BackboneBlog.Views.ArticleShow(model: model)
    @transition(view.render().el)
    
    # Subscribe for notifications
    @single_subscribe '/model/article/updated', (data)->
      updated = new BackboneBlog.Models.Article(data)
      if updated.id == model.id
        model.set(updated.attributes)

  edit: (id)->  
    model = new BackboneBlog.Models.Article(id: id)
    model.fetch()
    view = new BackboneBlog.Views.ArticleEdit(model: model)
    @transition(view.render().el)
    
    # Subscribe for notifications
    @single_subscribe '/model/article/updated', (data)->
      updated = new BackboneBlog.Models.Article(data)
      if updated.id == model.id
        view.warnOfUpdate()
        model.set(updated.attributes, {silent:true})
    
  new: ->
    model = new BackboneBlog.Models.Article()
    view = new BackboneBlog.Views.ArticleNew(model: model)
    @transition(view.render().el)
  
  transition: (el)->
    $('#content').html(el)