// var Conectc = (function (Connectc) {

//   Conectc.Helper = function (config) {
//     var self = this;
//     self.config = config || {};
//   };

//   /*
//    Init All date picker components.
//    */
//   Conectc.Helper.method("initDatePickers", function (jScope, options) {
//     var self = this,
//       defOptions = {
//         format: 'MM/DD/YYYY',
//         maxDate: new Date()
//       };

//     jScope = jScope || $(document);

//     $.extend(true, defOptions, options);

//     jScope.find(".date").datetimepicker(defOptions);

//     jScope.find(".date").on('dp.change', function (evt) {
//       var el = $(this),
//         data = el.data(),
//         date = data.date,
//         parentEl = $(this).closest('.date-parent');
//       if (date) {
//         if (el.hasClass('from-date')) {
//           parentEl.find('.to-date').data().DateTimePicker.minDate(date);
//         } else if (el.hasClass('to-date')) {
//           parentEl.find('.from-date').data().DateTimePicker.maxDate(date);
//         }
//       }
//     });

//     jScope.find(".date").trigger('dp.change');

//     $.each($(".date").find("input"), function (index, inputEle) {
//       $(inputEle).unbind('click').on("click", function () {
//         var jInputEle = $(this),
//           jCalendarSpan = jInputEle.siblings("span");
//         jCalendarSpan.trigger("click");
//       });
//     });

//   });

//   return Conectc;
// })(Conectc);