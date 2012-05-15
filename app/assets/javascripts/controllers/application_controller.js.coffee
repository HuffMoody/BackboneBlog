class BackboneBlog.Controllers.ApplicationController
  
  subscribe: (channel, callback)->
    @subscription.cancel() if @subscription?
    BackboneBlog.Notifications.subscribe(channel, callback)