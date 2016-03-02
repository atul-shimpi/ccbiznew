# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#activateshop").click (event) ->
    event.preventDefault()
    activate = parseInt($(this).attr("data_value"))
    btntext = ""
    if activate is 1
      activate = 0
      btntext = "Activate"
    else
      activate = 1
      btntext = "Deactivate"
    $.ajax
      url: "/admin/shops/activate/" + $(this).attr("data_id") + "/" + activate
      type: "get"
      success: (data) ->
        $(this).html btntext
        $(this).attr "data-value", activate














