$(function() {
  var options = {
  url: "/cls.json",

  getValue: "meaning",

  list: {

    onClickEvent: function() {
      var value = $("#color_box").getSelectedItemData().meaning;
      var checkbox = "<tr id='" +value + "'><td>" + value + "</td><td><input type='checkbox' class='size' id='"+ value + "xl" +"'><label for='"+ value + "xl" +"'></label></td><td><input type='checkbox' class='size' id='"+ value + "l" +"'><label for='"+ value + "l" +"'></label></td><td><input class='size' type='checkbox' id='"+ value + "m" +"'><label for='"+ value + "m" +"'></label></td><td><input type='checkbox' class='size' id='"+ value + "s" +"'><label for='"+ value + "s" +"'></label></td><td><input type='checkbox' class='size'  id='"+ value + "xs" +"'><label for='"+ value + "xs" +"'></label></td></tr>";

      $("tbody#color_row").append(checkbox);


    },

  match: {
    enabled: true
  },

  maxNumberOfElements: 8
  },

  theme: "plate-dark"

  };

  $("#color_box").easyAutocomplete(options);

  $("#create").on('click', function() {    

    var rows = document.getElementById("colorSize").rows;
    if (rows.length > 1) {
      for (i = 1; i < rows.length; i++) { 
        var sizes = ['xl', 'l', 'm', 's', 'xs'];
        for (m=0; m < sizes.length; m++) {

        var x = document.getElementById(rows[i].id + sizes[m]).checked;

        if (x) {

          var str = window.location.href;
          var n = str.match(/\/(\d+)\//);
          var model_id = n[1];
          var color = rows[i].id;
          var size = sizes[m];
        
          var product_data = {color: color, size: size, model: model_id};

          $.ajax({
            method: 'post',
            url: '/products',
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            data: JSON.stringify(product_data),
            success: function (data) {
              console.log(data);
              console.log(data.id);
            },
            error: function(err){
              console.log(err);
            }
          });

        }

        }
      }
    }





    // var tableRowlength = document.getElementById("colorSize").rows.length;    
    // console.log(tableRowlength);
    // var x = document.getElementById("Bluexl").checked;
    // var fruits = [];


    // if (x) {
    //   fruits.push(x);
    //   console.log('checked');
    // } else {
    //   fruits.remove(x);
    //   console.log('nope');
    // }

    // console.log(fruits);

    // $("tbody")
    //   // $("#"+ value + "xl").prop('checked')
    //   //   console.log('checked');

    //  if ('tr' in window) {
    //   console.log('egzistuoja');
    //  } else {
    //   console.log('nope');
    //  }

     // if ('[type="checkbox"]' in window) {
     //  console.log('exist');
     // } else {
     //  console.log('nope');
     // }
     // $("input.size").select
    // alert('boom');

      // if ($('[type="checkbox"]').prop("checked")) {
      //   console.log('exist');
      // }

  });
});

    // $("#"+ value + "xl").change(function() {


    //   var str = window.location.href;
    //   var n = str.match(/(\d+)$/);
    //   var model_id = n[0];

    //     var color = value;
    //     var size = "xl";
    //     var product_id = "";
       

    //     var product_data = {color: color, size: size, model: model_id};

      // if($("#"+ value + "xl").is(':checked')) {

    //     $.ajax({
    //         method: 'post',
    //         url: '/products',
    //         contentType: 'application/json; charset=utf-8',
    //         dataType: 'json',
    //         data: JSON.stringify(product_data),
    //         success: function (data) {
    //           console.log('success');
    //           console.log(data);
    //           product_id = data.id;
    //           console.log(product_id);
    //         },
    //         error: function(err){
    //           console.log('error');
    //           console.log(err);
    //         }
    //       });// checked
    //       alert('created');
    //   }
    //   else {

    //     var str = window.location.href;
    //     var n = str.match(/(\d+)$/);
    //     var model_id = n[0];

    //     var color = value;
    //     var size = "xl";      

        // var product_data = {color: color, size: size, model: model_id};

        // console.log('unchecked');
        // // console.log(product_id);
        // $.ajax({
        //     method: 'post',
        //     url: '/products/remove',
        //     contentType: 'application/json; charset=utf-8',
        //     dataType: 'json',
        //     data: JSON.stringify(product_data),
        //     success: function (data) {
        //       console.log('success');
        //       console.log(data);

        //       $.ajax({
        //         method: 'delete',
        //         url: '/products/' + data.id,
        //         contentType: 'application/json; charset=utf-8',
        //         dataType: 'json',
        //         data: JSON.stringify(product_data),
        //         success: function (data) {
        //           console.log('success deleted');
        //           console.log(data);





                  
    //             },
    //             error: function(err){
    //               console.log('error');
    //               console.log(err);
    //             }
    //           });// checked





    //         },
    //         error: function(err){
    //           console.log('error');
    //           console.log(err);
    //         }
    //       });// checked
    //     alert('Unchecked');  // unchecked
    //   }

    //   // if ("#"+ value + "xl").attr("checked") {
    //   //   alert('checked');
    //   // } else {
    //   //   alert('Unchecked');
    //   // }


    // });

    // $("#"+ value + "l").change(function() {

    //           var color = value;
    //     var size = "l";

    //     alert(color + size);
    // });

    // $("#"+ value + "m").change(function() {

    //           var color = value;
    //     var size = "m";

    //     alert(color + size);
    // });

    // $("#"+ value + "s").change(function() {

    //           var color = value;
    //     var size = "s";

    //     alert(color + size);
    // });

    // $("#"+ value + "xs").change(function() {

    //           var color = value;
    //     var size = "xs";

    //     alert(color + size);
    // });








// $(function() {

//   $("#model_form").on('submit', function(evt) {
//     evt.preventDefault();
//     var code = $("#model_code").val();
//     var title = $("#model_title").val();
//     var price = $("#model_price").val();
//     var gender = $("#model_gender_id").val();
//     var category = $("#model_category_id").val();
//     var note = $("#model_note").val();
//     console.log('inside model_form');

//     var model_data = {code: code, title: title, price: price, gender_id: gender, category_id: category, note: note};


//     if (code != '', title != '', price != '', gender != '', category != '', note != '') {
//           console.log('before post');

//           $.ajax({
//             method: 'post',
//             url: '/models',
//             contentType: 'application/json; charset=utf-8',
//             dataType: 'json',
//             data: JSON.stringify(model_data),
//             success: function (data) {
//               console.log('success');
//               console.log(data);

//               // 
//             },
//             error: function(err){
//               console.log('error');
//               console.log(err);
//             }
//           });

//     //   $.post('/models', {code: code, title: title, price: price, 
//     //   gender_id: gender, category_id: category, note: note}, 
//     //   function(e) {     
//     //     console.log(e);



//     //    }, 'json');
//     // } else {
//     //       console.log('something is empty');
//     //   alert('empty');
//     }




//   });
// });





// // $(function() {

// //   var options = {
// //   url: "/cls.json",

// //   getValue: "meaning",

// //   list: {
// //     onClickEvent: function() {
// //       var value = $(".color_box").getSelectedItemData().meaning;
//       // var checkbox = "<input type='checkbox' id='extra-large'><label for='extra-large'>Extra Large</label><br/><input type='checkbox' id='large'><label for='large'>Large</label><br/><input type='checkbox' id='medium'><label for='medium'>Medium</label><br/><input type='checkbox' id='small'><label for='small'>Small</label><br/><input type='checkbox' id='extra-small'><label for='extra-small'>Extra Small</label><br/>";

// //       $("div#color_meaning").append(value + "<br/>");
// //       $("div#color_meaning").append(checkbox);
// //       // $("div#size_div").append(checkbox);
// //     },

// //     match: {
// //       enabled: true
// //     },
// //     maxNumberOfElements: 8
// //   },

// //   theme: "plate-dark"

// //   };

// //   $(".color_box").easyAutocomplete(options);

// //   $("#model_form").on('submit', function(evt) {
// //     evt.preventDefault();
// //     var code = $("#code").val();
// //     var title = $("#model_title").val();
// //     var price = $("#model_price").val();
// //     var gender = $("#model_gender_id").val();
// //     var category = $("#model_category_id").val();
// //     var note = $("#model_note").val();

// //     $.post('/models', {code: code, title: title, price: price, 
// //     gender_id: gender, category_id: category, note: note}, 
// //     function() { alert('yay');
// //     }, 'json'));
// // };


// //   // $(".color_box").on('autocomplete.select', function(){
    
// //   //   console.log("yay");
// //   //   // var color = $(this).val();
// //   //   // $("#model_form").data('color', color);
// //   //   // $.post('/colors/create', {color: color}, function() {
// //   //   //   show_size_checkboxes();
// //   //   // });
// //   // });







// // // $(function() {
// // //     console.log("Yay");

// // //   // $("#model_form").on('submit', function(evt) {
// // //   //   evt.preventDefault();
// // //   //   var code = $("#code").val();
// // //   //   var title = $("#title").val();
// // //   //   if (code !== '' && title !== '') {
// // //   //     $.post('/models/create', {code: code, title: title}, function(model) {
// // //   //       $("#model_form").data('model_id', model.id);
// // //   //       show_success("Model created");
// // //   //       show_color_box();
// // //   //     }, 'json');
// // //   //   }
// // //   // });  
// // // // ​
// // // //   $(".color_box").autocomplete({config: "stuff here"});
// // // //   $(".color_box").on('autocomplete.select', function(){
// // // //     var color = $(this).val();
// // // //     $("#model_form").data('color', color);
// // // //     $.post('/colors/create', {color: color}, function() {
// // // //       show_size_checkboxes();
// // // //     });
// // // //   });
// // // // ​
// // // //   $("#add_color").on('click', function() {
// // // //     //clone .color_row
// // // //   });
// // // // ​
// // // //   $(".size_checkbox").on('change', function() {
// // // //     var sizebox = $(this);
// // // //     if (size.is(:checked)) {
// // // //       var size = $(this).val();
// // // //       var form = $("#model_form");
// // // //       $.post('/products/create', {model_id: form.data('model_id'), color: form.data('color'), size: size}, function(product) {
// // // //         sizebox.data('id', product.id);
// // // //       }, 'json');
// // // //     } else {
// // // //       //do above stuff to delete product, using the product ID saved as data attribute
// // // //       $.ajax({method: "DELETE", url: "/products/"+sizebox.data('id')});
// // // //     }
// // // //   });
// // // });