class BackboneBlog.Models.Article extends Backbone.Model
  schema:
    title:
      type: 'Text'
    published:
      type: 'Checkbox'
    content:
      type: 'TextArea'
  url: ->
    base = '/api/articles'
    if @isNew() then base else "#{base}/#{@get('id')}"