$(document).ready ->
  $("#new_comment_form").toggleClass("hidden")

$(document).on 'click', '#toggle_form', ->
  $("#new_comment_form").toggleClass("hidden")

$(document).on 'click', '.duel', ->
   url = $(@).attr('href')
   window.location.href = url if url
