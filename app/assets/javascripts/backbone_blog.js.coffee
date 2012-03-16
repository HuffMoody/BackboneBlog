window.BackboneBlog =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new BackboneBlog.Routers.Articles()
    Backbone.history.start
      pushState: true

$(document).ready ->
  BackboneBlog.init()
