class BackboneBlog.Routers.Articles extends Backbone.Router
  routes:
    '': 'index'
    'articles/:id': 'show'
    'articles/:id/edit': 'edit'
    
  initialize: ->
    @collection = new BackboneBlog.Collections.Articles()
    @collection.fetch()
    
  index: ->
    view = new BackboneBlog.Views.ArticlesIndex(collection: @collection)
    $('#container').html(view.render().el)
    
  show: (id)->
    alert "Entry #{id}"
    
  edit: (id)->
    create_view = =>
      view = new BackboneBlog.Views.ArticleEdit(model: @collection.get(id))
      $('#container').html(view.render().el)
    if @collection.models.length
      create_view()
    else
      _this = this
      @collection.on 'reset', ->
        create_view()
        _this.collection.off 'reset', this

