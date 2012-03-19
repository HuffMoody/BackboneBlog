class BackboneBlog.Views.ArticleNew extends Backbone.View
  template: JST['articles/new']
  
  events:
    'click .js-save-button': 'submitForm'
    'click .js-back-button': 'goBack'
  
  initialize: ->
    @form = new Backbone.Form
      model: @model
    @model.on 'change', =>
      Backbone.history.navigate("/articles/#{@model.id}", true)
  
  render: ->
    $(@el).html(@template(article: @model))
    @$('.new-article-form').html(@form.render().el)
    this
    
  submitForm: (event)->
    event.preventDefault()
    @form.commit()
    @model.save()
    
  goBack: (event)->
    event.preventDefault()
    Backbone.history.navigate '/articles', true
        