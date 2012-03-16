class BackboneBlog.Views.ArticlesIndexItem extends Backbone.View
  template: JST['articles/index_item']
  tagName: 'li'
  
  events:
    'click .js-edit-article': 'editArticle'
  
  render: ->
    $(@el).html(@template(article: @model))
    this
    
  editArticle: ->
    article_id = @$('input[name="article_id"]').val()
    Backbone.history.navigate("/articles/#{article_id}/edit", true)
  