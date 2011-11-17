$.ajaxSetup
  error: (jqXHR, textStatus, errorThrown) ->
    if jqXHR.status is 400
      alert jqXHR.responseText
    if jqXHR.status is 401
      alert 'Email or password incorrect'
      $.mobile.changePage 'login.html'
	  