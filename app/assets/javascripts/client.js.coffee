$(document).bind 'mobileinit', ->
  alert 'test'
  $.mobile.defaultPageTransition = 'none'

logout = ->
  localStorage.removeItem 'username'
  localStorage.removeItem 'password'
  update_footer()
  document.location.href = '/'

update_footer = ->
  username = localStorage.getItem 'username'
  if username?
    content = $ "<h4>#{username} <a href=\"#\" data-role=\"button\" data-inline=\"true\">logout</a></h4>"
    content.find('a').bind 'vclick', ->
      logout()
      toast "Logged out."
  else
    content = $ '<h4><a href="register.html" data-rel="dialog" data-role="button" data-inline="true" data-theme="b">Register</a> <a href="login.html" data-rel="dialog" data-role="button" data-inline="true">log in</a></h4>'
  content.addClass('ui-title').attr('role', 'heading')
  $('[data-role="footer"][footer-type="session"]').html(content).trigger 'create'

$.ajaxSetup
  error: (jqXHR, textStatus, errorThrown) ->
    if jqXHR.status is 400
      toast jqXHR.responseText
    if jqXHR.status is 401
      logout()
      toast 'Email or password incorrect'
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
      toast "Registered as #{email}.",
        force_page: true
  return false

$('form#login').live 'submit', (e) ->
  email = $('#email').val()
  password = $('#password').val()
  localStorage.setItem 'username', email
  localStorage.setItem 'password', password
  $.ajax 'users/test_login.json',
    async: false
    success: ->
      update_footer()
      $('.ui-dialog').dialog('close')
      toast "Logged in as #{email}.",
        force_page: true
      document.location.href = '/'
  return false

window.get_param = (name) ->
  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]")
  regexS = "[\\?&]" + name + "=([^&#]*)"
  regex = new RegExp regexS
  results = regex.exec window.location.href
  return "" if !results?
  return decodeURIComponent(results[1].replace(/\+/g, " "))
  
$(document).bind 'pageinit', update_footer
