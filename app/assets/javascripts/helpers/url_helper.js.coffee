window.UrlHelper =

  setup_dom: ->
    jQuery ->
      $('a[rel="pagelink"]').live 'click', (event)->
        event.preventDefault()
        Backbone.history.navigate($(this).attr('href'), true)

  initialize_model: (model, pathname)->
    model.url = @url_fct_for_model
    model.url_pathname = pathname
    _.bindAll(model, 'url')
    
  initialize_collection: (collection, pathname)->
    collection.url = @url_fct_for_collection
    collection.url_pathname = pathname
    _.bindAll(collection, 'url')
  
  url_fct_for_model: ->
    UrlHelper.server_model_url(this)
    
  url_fct_for_collection: ->
    UrlHelper.server_collection_url(this)
    
  server_model_url: (model)->
    "/api#{@model_url(model)}"
    
  server_collection_url: (collection)->
    "/api#{@collection_url(collection.url_pathname)}"
    
  model_url: (model, action = '')->
    base = "/#{model.url_pathname}"
    (if model.isNew() then base else "#{base}/#{model.get('id')}") + (if action then "/#{action}" else '')
    
  collection_url: (name, action = '')->
    "/#{name}" + (if action then "/#{action}" else '')
    
  navigate_to_model: (model)->
    Backbone.history.navigate(@model_url(model ), true)
  
  navigate_to_edit_model: (model)->
    Backbone.history.navigate(@model_url(model, 'edit'), true)
    
  navigate_to_new_model: (name)->
    Backbone.history.navigate(@collection_url(name, 'new'), true)
      
  navigate_to_collection: (name)->
    Backbone.history.navigate(@collection_url(name), true)
    
  
  
  