# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', 'form .remove_fields', (event) ->
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('fieldset').hide()
  event.preventDefault()

$(document).on 'click', 'form .add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('fields').replace(regexp, time))
  event.preventDefault()

$(document).on 'click', '#uploadfilenow', (event) ->  
  fielddetails = $(this).prevAll('input[type=file]')
  
  hiddenfield = $(this).prevAll('input[type=hidden]')
  console.log(hiddenfield)
  if fielddetails.val() != ''  

	  form = $('div#imageUploadForm')
	  
	  
	  formAction = form.attr('action')
	  data = new FormData();
	  data.append('imageFileField', fielddetails.prop('files')[0]);

	  $.ajax(
	    url: formAction
	    data: data
	    cache: false
	    contentType: false
	    processData: false
	    dataType: 'json'
	    type: 'POST').done (response) ->
	    if response != '0'
	      #success
	      hiddenfield.val response

	    else if response == 0
	      #error
	      alert 'Something went wrong: ' + response
	    return
