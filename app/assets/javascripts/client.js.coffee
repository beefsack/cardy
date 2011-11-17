$.ajaxSetup
  error: (jqXHR, textStatus, errorThrown) ->
    if jqXHR.status is 400
      alert jqXHR.responseText