// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require moment
//= require bootstrap-datetimepicker/bootstrap-datetimepicker.min

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

$(document).ready(function() {
  $('.dataTables-example').DataTable({
          responsive: true
  });
});
