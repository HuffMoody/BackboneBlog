class BackboneBlog.Views.ArticleEdit extends Backbone.View
  template: JST['articles/edit']
  
  events:
    'click .js-save-button': 'submitForm'
    'click .js-back-button': 'goBack'
    'submit form': 'submitForm'
  
  initialize: ->
    # Create Form
    @form = new Backbone.Form
      model: @model
    
    # Setup Events
    @model.on 'change', @render, this
  
  render: ->
    $(@el).html(@template(article: @model)).append(@form.render().el)
    this
    
  submitForm: (event)->
    event.preventDefault()
    @form.commit()
    @model.save()
    
  goBack: (event)->
    event.preventDefault()
    Backbone.history.navigate '/articles', true