class BackboneBlog.Models.Article extends Backbone.Model
  schema:
    title:
      type: 'Text'
    published:
      type: 'Checkbox'
    content:
      type: 'TextArea'
  
  initialize: ->
    UrlHelper.initialize_model(this, 'articles')