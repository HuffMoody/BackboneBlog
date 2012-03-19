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
  
  # setup navigation paths
  $('.navbar .nav a').live 'click', (event)->
    event.preventDefault()
    Backbone.history.navigate $(this).attr('href'), true