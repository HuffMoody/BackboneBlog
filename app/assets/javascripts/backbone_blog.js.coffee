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
    ModelParseJSON =
      incoming: (message, callback)->
        if message.channel.match(/^\/model\/.*/)
          message.data = $.parseJSON(message.data)
        callback(message)
    @Notifications.addExtension(ModelParseJSON)
    
    Logger =
      incoming: (message, callback)->
        unless message.channel.match(/^\/meta\/.*/)
          console.log("incoming--------")
          console.log(message)
          console.log("----------------")
          callback(message)
      outgoing: (message, callback)->
        unless message.channel.match(/^\/meta\/.*/)
          console.log("outgoing--------")
          console.log(message)
          console.log("----------------")
          callback(message)
    # @Notifications.addExtension(Logger)
    
    # Initialize Routers
    new BackboneBlog.Routers.ArticlesRouter()
    
    # Begin History
    Backbone.history.start
      pushState: true
      

$(document).ready ->
  BackboneBlog.init()