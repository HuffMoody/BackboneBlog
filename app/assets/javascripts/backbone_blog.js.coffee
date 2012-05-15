window.BackboneBlog =
  Controllers: {}
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    # Setup UrlHelpers
    UrlHelper.setup_dom()
    
    # Setup PubSub
    @Notifications = new Faye.Client('http://localhost:9292/faye')
    
    # Initialize Routers
    router = new BackboneBlog.Routers.ArticlesRouter()
    
    # Begin History
    Backbone.history.start
      pushState: true
      

$(document).ready ->
  BackboneBlog.init()