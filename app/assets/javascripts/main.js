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
        console.log(latLng)
      $("#shop_latitude").val(latLng.lat());
      $("#shop_longitude").val(latLng.lng());


        var map = $("#my_input").geocomplete("map");
        
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({'latLng': latLng }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                
                if (results[0]) {
                    var road = results[0].address_components[1].long_name;
                    var town = results[0].address_components[2].long_name;
                    var county = results[0].address_components[3].long_name;
                    var country = results[0].address_components[4].long_name;
                    $('#my_input').html(results[0].formatted_address);
                }
            }
        });

      
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

	$('#datetimepicker2').datepicker({
                    locale: 'en',

                });

	 
});

function getTimer(auctiondate){
  $('.countdown').countdown(auctiondate, function(event) {

    $(this).html("Auctions Starts In: "+ event.strftime('%d days %H:%M:%S'));
  }).on('finish.countdown', function(event) {
  	
  	//location.reload();
  });
} 
    
 

$(function () {
        $("#items1").sortable({
                containment: "#container1"
        });
        
        $("#items1").disableSelection();
});
jQuery( document ).ready(function( $ ) {
	$( "#add_more_owner" ).click(function() {
		var values = parseInt($(this).attr("data-value"));						
		$(this).attr("data-value",values + 1);
		var str ='<div class="form-group">';
		//for(i=0;i < $( "#no_of_owners" ).val();i++){
			str += '<label>Name</label><br><input type="text" id="ownername'+values+'" name="team[teamowners_attributes]['+values+'][name]" placeholder="Name" class="text_field form-control">';
			str += '<label>Description</label><br><textarea type="text" id="ownerdesc'+values+'" name="team[teamowners_attributes]['+values+'][description]" placeholder="Description" class="text_field form-control tinymce"></textarea>';
			str += '<label>Photo</label><br><input type="file" id="ownerphoto'+values+'" name="team[teamowners_attributes]['+values+'][photo]">' ;
		//}
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
var jcrop_api, boundx, boundy;
function fileSelectHandler() {

    // get selected file
    var oFile = $('#shop_image_image')[0].files[0];

    // hide all errors
    $('.error').hide();

    // check for image type (jpg and png are allowed)
    var rFilter = /^(image\/jpeg|image\/png)$/i;
    if (! rFilter.test(oFile.type)) {
        $('.error').html('Please select a valid image file (jpg and png are allowed)').show();
        return;
    }

    // check for file size    
    // check for file size
    
    // preview element
    var oImage = document.getElementById('preview');

    // prepare HTML5 FileReader
    var oReader = new FileReader();
        oReader.onload = function(e) {

        // e.target.result contains the DataURL which we can use as a source of the image
        oImage.src = e.target.result;
        oImage.onload = function () { // onload event handler

            // display step 2
            $('.step2').fadeIn(500);
            // display some basic image info
            var sResultFileSize = bytesToSize(oFile.size);
            $('#filesize').val(sResultFileSize);
            $('#filetype').val(oFile.type);
            $('#filedim').val(oImage.naturalWidth + ' x ' + oImage.naturalHeight);

            // destroy Jcrop if it is existed
            if (typeof jcrop_api != 'undefined') {
                jcrop_api.destroy();
                jcrop_api = null;
                
            }
            $('#preview').width(oImage.naturalWidth);
            $('#preview').height(oImage.naturalHeight);
            
            setTimeout(function(){
                // initialize Jcrop
                $('#preview').Jcrop({
                    minSize: [32, 32], // min crop size                   
                    aspectRatio : 16 / 5.7, // keep aspect ratio 1:1
                    bgFade: true, // use fade effect
                    bgOpacity: .3, // fade opacity
                    onChange: updateInfo,
                    onSelect: updateInfo,
                    onRelease: clearInfo
                }, function(){

                    // use the Jcrop API to get the real image size
                    var bounds = this.getBounds();
                    boundx = bounds[0];
                    boundy = bounds[1];

                    // Store the Jcrop API in the jcrop_api variable
                    jcrop_api = this;
                });
            },1000);

        };
    };

    // read selected file as DataURL
    oReader.readAsDataURL(oFile);
}
function updateInfo(coords) {    
    $('#shopimage_image_crop_x').val(coords.x)
    $('#shopimage_image_crop_y').val(coords.y)
    $('#shopimage_image_crop_w').val(coords.w)
    $('#shopimage_image_crop_h').val(coords.h)
    $('#w').val(coords.w);
    $('#h').val(coords.h);
};
function clearInfo() {
   // $('.info #w').val('');
   // $('.info #h').val('');
};
// convert bytes into friendly format
function bytesToSize(bytes) {
    var sizes = ['Bytes', 'KB', 'MB'];
    if (bytes == 0) return 'n/a';
    var i = parseInt(Math.floor(Math.log(bytes) / Math.log(1024)));
    return (bytes / Math.pow(1024, i)).toFixed(1) + ' ' + sizes[i];
};