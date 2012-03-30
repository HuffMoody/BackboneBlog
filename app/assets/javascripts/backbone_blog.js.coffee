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

$(document).ready ->
  BackboneBlog.init()