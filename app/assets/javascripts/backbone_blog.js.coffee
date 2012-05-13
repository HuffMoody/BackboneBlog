window.BackboneBlog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    # Initialize Routers
    new BackboneBlog.Routers.Articles()
    
    # Begin History
    Backbone.history.start
      pushState: true
      
    # Setup UrlHelpers
    UrlHelper.setup_dom()
    
    # Setup Faye
    faye = new Faye.Client('http://localhost:9292/faye')
    faye.subscribe '/articles/new', (data)->
      alert(data)

$(document).ready ->
  BackboneBlog.init()