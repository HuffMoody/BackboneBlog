class BackboneBlog.Controllers.ApplicationController
  
  subscriptions: {}
  
  single_subscribe: (channel, callback)->
    @subscriptions[channel].cancel() if @subscriptions[channel]?
    @subscriptions[channel] = @subscribe(channel, callback)
      
  
  subscribe: (channel, callback)->
    BackboneBlog.Notifications.subscribe(channel, callback)