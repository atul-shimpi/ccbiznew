// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require moment

// var Conectc = (function (Connectc) {

//   Conectc.Main = function (config) {
//     var self = this;
//     self.config = config || {};
//   };

//   Conectc.Main.method("init", function () {
//       cChakra.helper().initDatePickers();
//   });
  
//   return Conectc;
// })(Conectc);

jQuery( document ).ready(function( $ ) {
  $('.dataTables-example').DataTable({
          responsive: true,
					columnDefs: [{ targets: -1, orderable: false }]
					    
	});

  
  	$("#my_input").bind("geocode:dragged", function(event, latLng){
      $("#shop_latitude").val(latLng.lat());
      $("#shop_longitude").val(latLng.lng());
      
    });
    $("#find").click(function(){
      $("#my_input").trigger("geocode");
    }).click();
});

jQuery( document ).ready(function( $ ) {
	var startDate = new Date();
	var endDate = new Date();
	$('#date-start')
	    .datepicker()
	    .on('changeDate', function(ev){
	        if (ev.date.valueOf() > endDate.valueOf()){
	            $('#start_alert').show().find('strong').text('The start date must be before the end date.');
	        } else {
	            $('#start_alert').hide();
	            startDate = new Date(ev.date);
	            $('#date-start-display').val($('#date-start').data('date'));
	        }
	        $('#date-start').datepicker('hide');
	    });
	$('#date-end')
	    .datepicker()
	    .on('changeDate', function(ev){
	        if (ev.date.valueOf() < startDate.valueOf()){
	            $('#end_alert').show().find('strong').text('The end date must be after the start date.');
	        } else {
	            $('#end_alert').hide();
	            endDate = new Date(ev.date);
	            $('#date-end-display').val($('#date-end').data('date'));
	        }
	        $('#date-end').datepicker('hide');
	    });

	$('#event-date')
	    .datepicker()
	    .on('changeDate', function(ev){	        
	            
	            endDate = new Date(ev.date);
	            $('#event-date-display').val($('#event-date').data('date'));
	        
	        $('#event-date').datepicker('hide');
	    });

});

$(function () {
        $("#items1").sortable({
                containment: "#container1"
        });
        
        $("#items1").disableSelection();
});
jQuery( document ).ready(function( $ ) {
	$( "#no_of_owners" ).blur(function() {
		var str ='<div class="form-group">';
		for(i=0;i < $( "#no_of_owners" ).val();i++){
			str += '<label>Name</label><br><input type="text" id="ownername'+i+'" name="team[teamowners_attributes]['+i+'][name]" placeholder="Name" class="text_field form-control">';
			str += '<label>Description</label><br><textarea type="text" id="ownerdesc'+i+'" name="team[teamowners_attributes]['+i+'][description]" placeholder="Description" class="text_field form-control tinymce"></textarea>';
			str += '<label>Photo</label><br><input type="file" id="ownerphoto'+i+'" name="team[teamowners_attributes]['+i+'][photo]">' ;
		}
		str += '</div>';
	  	$("#owerlist").append(str);

	  	tinyMCE.init({
	      selector: "textarea.tinymce",
	      toolbar: "styleselect | bold italic | undo redo | table | forecolor | backcolor | emoticons | visualblocks",
	      plugins: "table,uploadimage,textcolor,colorpicker,emoticons,hr,textpattern,visualblocks"
	    });
	});
});
// jQuery( document ).ready(function( $ ) {
// $(".newform").validate({
// 	rules: {

// 	},
// 	messages: {
		
// 	}
// });
// });
