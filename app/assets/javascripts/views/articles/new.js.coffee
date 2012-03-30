class BackboneBlog.Views.ArticleNew extends Backbone.View
  template: JST['articles/new']
  
  events:
    'click .js-save-button': 'submitForm'
    'click .js-back-button': 'goBack'
    'submit form': 'submitForm'
  
  initialize: ->
    @form = new Backbone.Form
      model: @model
    @model.on 'change', =>
      # redirect to show after save
      UrlHelper.navigate_to_model(model)
  
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
    UrlHelper.navigate_to_collection('articles')
        