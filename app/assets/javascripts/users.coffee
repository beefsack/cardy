# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('form#register').live 'submit', (e) ->
  $.ajax 'users',
    async: false
    type: 'POST'
    data:
      user:
        email: $('#email').val()
        password: $('#password').val()
    success: ->
      $.mobile.changePage 'index.html'
  return false