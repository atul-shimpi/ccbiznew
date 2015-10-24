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
});

jQuery( document ).ready(function( $ ) {
	var startDate = new Date(2012,1,20);
	var endDate = new Date(2012,1,25);
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

});
