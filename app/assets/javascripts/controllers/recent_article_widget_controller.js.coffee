class BackboneBlog.Controllers.RecentArticleWidgetController extends BackboneBlog.Controllers.ApplicationController
  
  constructor: ->    
    model = new BackboneBlog.Models.Article(id: 'newest')
    model.fetch
      success: =>
        model.set('id', null) if model.id == 'newest'
        view = new BackboneBlog.Views.RecentArticle(model: model)
        view.render()
    
    @subscribe "/model/article/updated/*", (data)->
      updated = new BackboneBlog.Models.Article(data)
      if updated.id == model.id
        model.set(updated.attributes)
        
    @subscribe "/model/article/created", (data)->
      created = new BackboneBlog.Models.Article(data)
      model.set(created.attributes)
      
    @subscribe "/model/article/destroyed/*", (data)->
      replaced = new BackboneBlog.Models.Article(id: 'newest')
      replaced.fetch
        success: =>
          replaced.set('id', null) if replaced.id == 'newest'
          model.set(replaced.attributes)