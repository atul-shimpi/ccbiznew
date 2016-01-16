# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  if $('#isdiff_venue').is(':checked')
    $('#event_venue').show()
  else
    $('#event_venue').hide()
  $('#isdiff_venue').change ->
    if $(this).is(':checked')
      $('#event_venue').show 'slow'
    else
      $('#event_venue').hide 'slow'
    return
  return