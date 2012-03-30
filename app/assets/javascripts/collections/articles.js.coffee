class BackboneBlog.Collections.Articles extends Backbone.Collection
  model: BackboneBlog.Models.Article
  
  initialize: ->
    UrlHelper.initialize_collection(this, 'articles')

