class BackboneBlog.Views.ArticleEdit extends Backbone.View
  template: JST['articles/edit']
  
  events:
    'click .js-save-button': 'submitForm'
    'click .js-back-button': 'goBack'
    'click .js-reload-article': 'reload'
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
    @submitted = true
    @form.commit()
    @model.save()
    
  warnOfUpdate: ->
    if @submitted then @submitted = false else @showWarning()
    
  goBack: (event)->
    event.preventDefault()
    UrlHelper.navigate_to_collection('articles')
    
  showWarning: ->
    @.$(".alert").removeClass('hidden')
    
  hideWarning: ->
    @.$(".alert").addClass('hidden')
  
  reload: (event)->
    event.preventDefault()
    @hideWarning()
    @render()
