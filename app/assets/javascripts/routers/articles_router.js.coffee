class BackboneBlog.Routers.ArticlesRouter extends Backbone.Router
  routes:
    '': 'index'
    'articles': 'index'
    'articles/new': 'new'
    'articles/:id': 'show'
    'articles/:id/edit': 'edit'
    
  constructor: ->
    super()
    @controller = new BackboneBlog.Controllers.ArticlesController()
    
  index: ->
    @controller.index()
    
  show: (id)->
    @controller.show(id)
    
  edit: (id)->  
    @controller.edit(id)

  new: ->
    @controller.new()
  