logout = ->
  localStorage.removeItem 'username'
  localStorage.removeItem 'password'
  update_footer()

update_footer = ->
  username = localStorage.getItem 'username'
  if username?
    $('[data-role="footer"] h4').html "Logged in as #{username}, <a class=\"ui-link\" href=\"#\">logout</a>."
    $('[data-role="footer"] h4').find('a').bind 'vclick', ->
      logout()
      $.mobile.changePage 'index.html'
  else
    $('[data-role="footer"] h4').html '<a class=\"ui-link\" href="register.html">Register</a> or <a class=\"ui-link\" href="login.html">log in</a>.'

$.ajaxSetup
  error: (jqXHR, textStatus, errorThrown) ->
    if jqXHR.status is 400
      alert jqXHR.responseText
    if jqXHR.status is 401
      logout()
      alert 'Email or password incorrect'
      $.mobile.changePage 'login.html'
  beforeSend: (jqHXR, settings) ->
    username = localStorage.getItem 'username'
    password = localStorage.getItem 'password'
    if username? and password?
      header = "Basic " + btoa "#{username}:#{password}"
      settings.headers = {} if not settings.headers?
      settings.headers.Authorization = header
      jqHXR.setRequestHeader 'Authorization', header
      
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
  localStorage.setItem 'username', $('#email').val()
  localStorage.setItem 'password', $('#password').val()
  $.ajax 'users/test_login.json',
    async: false
    success: ->
      update_footer()
      $.mobile.changePage 'index.html'
  return false
  
$(document).bind 'pageinit', update_footer
