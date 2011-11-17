logout = ->
  localStorage.removeItem 'username'
  localStorage.removeItem 'password'
  update_footer()

update_footer = ->
  username = localStorage.getItem 'username'
  if username?
    content = $ "<h4>#{username} <a href=\"#\" data-role=\"button\" data-inline=\"true\">logout</a></h4>"
    content.find('a').bind 'vclick', ->
      logout()
      $.mobile.changePage 'index.html'
  else
    content = $ '<h4><a href="register.html" data-rel="dialog" data-role="button" data-inline="true" data-theme="b">Register</a> <a href="login.html" data-rel="dialog" data-role="button" data-inline="true">log in</a></h4>'
  content.addClass('ui-title').attr('role', 'heading')
  $('[data-role="footer"][footer-type="session"]').html(content).trigger 'create'

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
  email = $('#email').val()
  password = $('#password').val()
  $.ajax 'users.json',
    async: false
    type: 'POST'
    data:
      user:
        email: email
        password: password
    success: ->
      localStorage.setItem 'username', email
      localStorage.setItem 'password', password
      update_footer()
      $('.ui-dialog').dialog('close')
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
      $('.ui-dialog').dialog('close')
  return false
  
$(document).bind 'pageinit', update_footer
