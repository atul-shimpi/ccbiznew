# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  if $('#isowndomain').is(':checked')
    $('#shop_domain').show()
  else
    $('#shop_domain').hide()
  $('#isowndomain').change ->
    if $(this).is(':checked')
      $('#shop_domain').show 'slow'
    else
      $('#shop_domain').hide 'slow'
    return
  return