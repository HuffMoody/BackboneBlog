class BackboneBlog.Controllers.ArticlesController extends BackboneBlog.Controllers.ApplicationController
    
  index: ->
    @cancel_subscriptions()
    
    collection = new BackboneBlog.Collections.Articles()
    collection.fetch()
    view = new BackboneBlog.Views.ArticlesIndex(collection: collection)
    $('#content').html(view.render().el)
    
    # Subscribe for notifications
    @single_subscribe "/model/article/created", (data)->
      model = new BackboneBlog.Models.Article(data)
      unless collection.get(model.id)
        collection.add(model)
        
    @single_subscribe "/model/article/destroyed/*", (data)->
      model = new BackboneBlog.Models.Article(data)
      if collection.get(model.id)
        collection.remove(model)
        
    @single_subscribe "/model/article/updated/*", (data)->
      updated = new BackboneBlog.Models.Article(data)
      model = collection.get(updated.id)
      if model?
        model.set(updated.attributes)

  show: (id)->
    @cancel_subscriptions()
    
    model = new BackboneBlog.Models.Article(id: id)
    model.fetch()
    view = new BackboneBlog.Views.ArticleShow(model: model)
    $('#content').html(view.render().el)
    
    # Subscribe for notifications
    @single_subscribe "/model/article/updated/#{id}", (data)->
      updated = new BackboneBlog.Models.Article(data)
      model.set(updated.attributes)

  edit: (id)-> 
    @cancel_subscriptions() 
    
    model = new BackboneBlog.Models.Article(id: id)
    model.fetch()
    view = new BackboneBlog.Views.ArticleEdit(model: model)
    $('#content').html(view.render().el)
    
    # Subscribe for notifications
    @single_subscribe "/model/article/updated/#{id}", (data)->
      updated = new BackboneBlog.Models.Article(data)
      view.warnOfUpdate()
      model.set(updated.attributes, silent:true)
    
  new: ->
    @cancel_subscriptions()
    
    model = new BackboneBlog.Models.Article()
    view = new BackboneBlog.Views.ArticleNew(model: model)
    $('#content').html(view.render().el)