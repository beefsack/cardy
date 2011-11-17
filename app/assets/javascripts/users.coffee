# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('form#register').live 'submit', (e) ->
  $.ajax 'users.json',
    async: false
    type: 'POST'
    data:
      user:
        email: $('#email').val()
        password: $('#password').val()
    success: ->
      localStorage.setItem 'username', username
      localStorage.setItem 'password', password
      update_footer()
      $.mobile.changePage 'index.html'
  return false

$('form#login').live 'submit', (e) ->
  username = $('#email').val()
  password = $('#password').val()
  $.ajax 'users/test_login.json',
    async: false
    username: $('#email').val()
    password: $('#password').val()
    success: ->
      localStorage.setItem 'username', username
      localStorage.setItem 'password', password
      update_footer()
      $.mobile.changePage 'index.html'
  return false

logout = ->
  localStorage.removeItem 'username'
  localStorage.removeItem 'password'
  update_footer()
  $.mobile.changePage 'index.html'

update_footer = ->
  username = localStorage.getItem 'username'
  if username?
    $('[data-role="footer"] h4').html "Logged in as #{username}, <a href=\"#\">logout</a>."
    $('[data-role="footer"] h4').find('a').bind 'vclick', logout
  else
    $('[data-role="footer"] h4').html '<a href="register.html">Register</a> or <a href="login.html">log in</a>.'

$(document).bind 'pageinit', update_footer