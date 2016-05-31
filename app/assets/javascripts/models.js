$(function() {

  function isInArray(value, array) {
    return array.indexOf(value) > -1;
  }

  $('#color_box').keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);

    if (null != $("#color_box").val()) {

      if(keycode == '13'){
        var value = $("#color_box").val().toUpperCase();
        var rows = document.getElementById("colorSize").rows;

        var str = window.location.href;
        var n = str.match(/\/(\d+)\//);
        var model_id = n[1];
        var products = [];

        var sizes = ['XL', 'L', 'M', 'S', 'XS'];


        var checkbox = "<tr id='" + value + "'><td>" + value + "</td><td><input type='checkbox' class='size' id='"+ value + "-XL" +"'><label for='"+ value + "-XL" +"'></label></td><td><input type='checkbox' class='size' id='"+ value + "-L" +"'><label for='"+ value + "-L" +"'></label></td><td><input class='size' type='checkbox' id='"+ value + "-M" +"'><label for='"+ value + "-M" +"'></label></td><td><input type='checkbox' class='size' id='"+ value + "-S" +"'><label for='"+ value + "-S" +"'></label></td><td><input type='checkbox' class='size'  id='"+ value + "-XS" +"'><label for='"+ value + "-XS" +"'></label></td><td><a href='' onclick='javascript:tbody#color_row.removeChild(tbody#color_row.childNodes[0])'>Remove</a></td></tr>";
        $("tbody#color_row").append(checkbox);


        for (i = 0; i < sizes.length; i++) {
          var product_data = {color: value, size: sizes[i], model: model_id, in_storage: false};
          products.push(product_data);
        }

        console.log('before call');

        $.ajax({
          method: 'post',
          url: '/products',
          contentType: 'application/json; charset=utf-8',
          dataType: 'json',
          data: JSON.stringify(products),
          success: function (data) {
            console.log(data);
          },
          error: function(err){
            console.log(err);
          }
        });

        console.log('after call');

        $("#color_box").val('');
      }
    }
    

  });

  // $("#create").on('click', function() {    
  //   var rows = document.getElementById("colorSize").rows;
  //   var str = window.location.href;
  //   var n = str.match(/\/(\d+)\//);
  //   var model_id = n[1];
  //   var products = [];

  //   if (rows.length > 1) {
  //     for (i = 1; i < rows.length; i++) {
  //       var sizes = ['xl', 'l', 'm', 's', 'xs'];
  //       var color = rows[i].id;
  //       for (m = 0; m < sizes.length; m++) {
  //         var x = document.getElementById(rows[i].id + sizes[m]).checked;
  //         var size = sizes[m];
  //         if (x) {
  //           var product_data = {color: color, size: size, model: model_id};
  //           products.push(product_data);
  //         };
  //       };
  //     };

  //     if (products.length > 0) {
  //       $.ajax({
  //         method: 'post',
  //         url: '/products',
  //         contentType: 'application/json; charset=utf-8',
  //         dataType: 'json',
  //         data: JSON.stringify(products),
  //         success: function (data) {
  //           console.log(data);
  //         },
  //         error: function(err){
  //           console.log(err);
  //         }
  //       });
  //     } else {
  //       alert('No products selected.');
  //       return false;
  //     };
  //   };

  //   $.ajax({
  //     method: 'get',
  //     url: '/models/' + model_id,
  //     contentType: 'application/json; charset=utf-8',
  //     dataType: 'json',
  //     success: function (data) {
  //       window.location = '/models/' + model_id
  //     },
  //     error: function(err){
  //       console.log(err);
  //     }
  //   });
  // });

  $(".size").on('click', function() { 
    // console.log('clicked');
    var rows = document.getElementById("colorSize").rows;
    var str = window.location.href;
    var n = str.match(/\/(\d+)\//);
    var model_id = n[1];

    var color = this.id.match(/(\w+)/);
    var size = this.id.match(/\w+$/);

    console.log(this.id);
    console.log(model_id);
    console.log(color);
    console.log(size);

        // var x = document.getElementById(this.id);
        // console.log(x);
        // console.log(x.checked);
    if(this.checked) {

        var product_data = {model: model_id, color: color, size: size, in_storage: true};
      }{
                var product_data = {model: model_id, color: color, size: size, in_storage: false};

      }

        // $.ajax({
        //   method: 'put',
        //   url: '/products',
        //   contentType: 'application/json; charset=utf-8',
        //   dataType: 'json',
        //   success: function (data) {
        //     window.location = '/models/' + model_id
        //   },
        //   error: function(err){
        //     console.log(err);
        //   }
        // });

        $.ajax({
          method: 'put',
          url: '/products_update',
          contentType: 'application/json; charset=utf-8',
          dataType: 'json',
          data: JSON.stringify(product_data),
          success: function(data) {
            window.location = '/models/' + model_id
          },
          error: function(err){
            console.log(err);
          }
        });

   //    for (i = 1; i < rows.length; i++) {
   //      var sizes = ['XL', 'L', 'M', 'S', 'XS'];
   //      var color = rows[i].id;
   //      for (m = 0; m < sizes.length; m++) {
   //        var size = sizes[m];
   //        console.log(size);
   //        console.log(rows[i].id);
   //        var x = document.getElementById(rows[i].id + sizes[m]).checked;
   //        if (x) {
   //          var product_data = {color: color, size: size, model: model_id};
   //          products.push(product_data);
   //        };
   //      };

   //  if(this.checked) {
   //    console.log('checking'); 
   //    // console.log(this);

   //    var str = window.location.href;
   //    var n = str.match(/\/(\d+)\//);
   //    var model_id = n[1];

   //    // var color_new = "RED";
   //    // var size_new = "XL";

   //    var product_data = {color: color_new, size: size_new, model: model_id};

   //    $.ajax({
   //        method: 'put',
   //        url: '/products',
   //        contentType: 'application/json; charset=utf-8',
   //        dataType: 'json',
   //        data: JSON.stringify(product_data),
   //        success: function (data) {
   //          console.log(data);
   //        },
   //        error: function(err){
   //          console.log(err);
   //        }
   //      });


   //  } else {
   //    console.log('unchecking'); 
   //    // console.log(this);


   //    $.ajax({
   //        method: 'post',
   //        url: '/products/delete_item',
   //        contentType: 'application/json; charset=utf-8',
   //        dataType: 'json',
   //        data: JSON.stringify(product),
   //        success: function(data) {
   //          console.log('deleted');
   //        },
   //        error: function(err){
   //          console.log(err);
   //        }
   //      });

   //  }
   // }  
  });

  $(".order_button").on('click', function() {

    var order_items = [];
    $('#product_table tr').each(function() {
      var product_id = $(this).find("#product_id").val();
      var quantity = $(this).find("#quantity").val();

      if (!!quantity) {
        if (quantity < 0) {
          alert('You cannot order negative number of products');
          console.log('You cannot order negative number of products');
          return false;
        } else {
          var item_data = {product_id: product_id, quantity: quantity}
          console.log(item_data);
          order_items.push(item_data);
        };
      }
    });
    if (order_items.length > 0) {
      $.ajax({
        method: 'post',
        url: '/cart',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: JSON.stringify(order_items),
        success: function (data) {
          console.log('success');
          window.location = '/cart'
        },
        error: function(err){
          console.log('error');
          window.location = '/cart'
          // to-do: it is not hitting success function even though it posts well.
        }
      });
    } else {
      alert('No product selected');
      console.log('No product selected');
    };
  });
});

// function checkAddress(checkbox)
// {
//     if (checkbox.checked)
//     {
//       // remove product
//     } else {
//       // add product
//     }
// };

function readURL() {

  var preview = document.querySelector('#img_upload');
  var files   = document.querySelector('input[type=file]').files;

  function readAndPreview(file) {

    // Make sure `file.name` matches our extensions criteria
    if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
      var reader = new FileReader();

      reader.addEventListener("load", function () {
        var image = new Image();
        image.height = 100;
        image.title = file.name;
        image.src = this.result;
        image.onclick = function() { remove(this); }

        preview.appendChild( image );

      }, false);

      reader.readAsDataURL(file);

      }

  }

  if (files) {
    [].forEach.call(files, readAndPreview);
  }
};

