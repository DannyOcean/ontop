$(document).on 'click', '.duel', ->
   url = $(@).attr('href')
   window.location.href = url if url