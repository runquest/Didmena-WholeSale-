$(function() {
    console.log("Yay");

  // $("#model_form").on('submit', function(evt) {
  //   evt.preventDefault();
  //   var code = $("#code").val();
  //   var title = $("#title").val();
  //   if (code !== '' && title !== '') {
  //     $.post('/models/create', {code: code, title: title}, function(model) {
  //       $("#model_form").data('model_id', model.id);
  //       show_success("Model created");
  //       show_color_box();
  //     }, 'json');
  //   }
  // });  
// ​
//   $(".color_box").autocomplete({config: "stuff here"});
//   $(".color_box").on('autocomplete.select', function(){
//     var color = $(this).val();
//     $("#model_form").data('color', color);
//     $.post('/colors/create', {color: color}, function() {
//       show_size_checkboxes();
//     });
//   });
// ​
//   $("#add_color").on('click', function() {
//     //clone .color_row
//   });
// ​
//   $(".size_checkbox").on('change', function() {
//     var sizebox = $(this);
//     if (size.is(:checked)) {
//       var size = $(this).val();
//       var form = $("#model_form");
//       $.post('/products/create', {model_id: form.data('model_id'), color: form.data('color'), size: size}, function(product) {
//         sizebox.data('id', product.id);
//       }, 'json');
//     } else {
//       //do above stuff to delete product, using the product ID saved as data attribute
//       $.ajax({method: "DELETE", url: "/products/"+sizebox.data('id')});
//     }
//   });
});