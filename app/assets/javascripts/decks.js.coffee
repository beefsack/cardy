$('#searchPage').live 'pageshow', ->
  query = get_param "query"
  $(this).find('#query').val window.get_param("query")
  