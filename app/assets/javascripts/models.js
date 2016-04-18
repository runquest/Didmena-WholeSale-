$(function() {

  var options = {
  url: "/cls.json",

  getValue: "meaning",

  list: {
    onClickEvent: function() {
      var value = $(".color_box").getSelectedItemData().meaning;
      var checkbox = "<input type='checkbox' id='extra-large'><label for='extra-large'>Extra Large</label><br/><input type='checkbox' id='large'><label for='large'>Large</label><br/><input type='checkbox' id='medium'><label for='medium'>Medium</label><br/><input type='checkbox' id='small'><label for='small'>Small</label><br/><input type='checkbox' id='extra-small'><label for='extra-small'>Extra Small</label><br/>";

      $("div#color_meaning").append(value + "<br/>");
      $("div#color_meaning").append(checkbox);
      // $("div#size_div").append(checkbox);
    },

    match: {
      enabled: true
    },
    maxNumberOfElements: 8
  },

  theme: "plate-dark"

  };

  $(".color_box").easyAutocomplete(options);
});


  // $(".color_box").on('autocomplete.select', function(){
    
  //   console.log("yay");
  //   // var color = $(this).val();
  //   // $("#model_form").data('color', color);
  //   // $.post('/colors/create', {color: color}, function() {
  //   //   show_size_checkboxes();
  //   // });
  // });







// $(function() {
//     console.log("Yay");

//   // $("#model_form").on('submit', function(evt) {
//   //   evt.preventDefault();
//   //   var code = $("#code").val();
//   //   var title = $("#title").val();
//   //   if (code !== '' && title !== '') {
//   //     $.post('/models/create', {code: code, title: title}, function(model) {
//   //       $("#model_form").data('model_id', model.id);
//   //       show_success("Model created");
//   //       show_color_box();
//   //     }, 'json');
//   //   }
//   // });  
// // ​
// //   $(".color_box").autocomplete({config: "stuff here"});
// //   $(".color_box").on('autocomplete.select', function(){
// //     var color = $(this).val();
// //     $("#model_form").data('color', color);
// //     $.post('/colors/create', {color: color}, function() {
// //       show_size_checkboxes();
// //     });
// //   });
// // ​
// //   $("#add_color").on('click', function() {
// //     //clone .color_row
// //   });
// // ​
// //   $(".size_checkbox").on('change', function() {
// //     var sizebox = $(this);
// //     if (size.is(:checked)) {
// //       var size = $(this).val();
// //       var form = $("#model_form");
// //       $.post('/products/create', {model_id: form.data('model_id'), color: form.data('color'), size: size}, function(product) {
// //         sizebox.data('id', product.id);
// //       }, 'json');
// //     } else {
// //       //do above stuff to delete product, using the product ID saved as data attribute
// //       $.ajax({method: "DELETE", url: "/products/"+sizebox.data('id')});
// //     }
// //   });
// });