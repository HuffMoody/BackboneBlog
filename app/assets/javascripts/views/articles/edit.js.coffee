class BackboneBlog.Views.ArticleEdit extends Backbone.View
  template: JST['articles/edit']
  
  events:
    'click .js-submit-form': 'submitForm'
  
  initialize: ->
    @form = new Backbone.Form
      model: @model
  
  render: ->
    $(@el).html(@template(article: @model))
    @$('.edit-article-form').html(@form.render().el)
    this
    
  submitForm: ->
    @form.commit()
    @model.save()
    $(@form.el).highlight()
    @render()