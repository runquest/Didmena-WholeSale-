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

    }

  $("#color_box").easyAutocomplete(options);

  $("#create").on('click', function() {    
    var rows = document.getElementById("colorSize").rows;
    var str = window.location.href;
    var n = str.match(/\/(\d+)\//);
    var model_id = n[1];
    var products = [];

    if (rows.length > 1) {
      for (i = 1; i < rows.length; i++) {
        var sizes = ['xl', 'l', 'm', 's', 'xs'];
        var color = rows[i].id;
        for (m = 0; m < sizes.length; m++) {
          var x = document.getElementById(rows[i].id + sizes[m]).checked;
          var size = sizes[m];
          if (x) {
            var product_data = {color: color, size: size, model: model_id};
            products.push(product_data);
          };
        };
      };

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
    };

    $.ajax({
      method: 'get',
      url: '/models/' + model_id,
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      success: function (data) {
        window.location = '/models/' + model_id
      },
      error: function(err){
        console.log(err);
      }
    });
  });

  $(".size").on('click', function() { 
    
    if(this.checked) {
      console.log('checking'); 
    } else {
      console.log('unchecking'); 
    }
     
  });

  $(".order_button").on('click', function() {

    var order_items = [];
    $('#product_table tr').each(function() {
      var product_id = $(this).find("#product_id").val();
      var quantity = $(this).find("#quantity").val();

      if (!!quantity) {
        var item_data = {product_id: product_id, quantity: quantity}
        console.log(item_data);
        order_items.push(item_data);
      }
    });

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
  });
});

// function readURL(input) {

//   if (input.files) {
  
//     for (i = 0; i < input.files.length; i++) {

//       var image_id_html = "img_prev" + i;
//       var image = '<img id=' + image_id_html + ' src="#" alt="your image" />';
//       $("div#img_upload").append(image);

//       var image_id = "#img_prev" + i;
//       var reader = new FileReader();

//       // console.log(reader);

//       reader.onload = function (e) {  
//         console.log(e.target.result);
//         $(image_id)
//           .attr('src', e.target.result)
//           .width(150)
//           .height(200);
//       };

//       reader.readAsDataURL(input.files[i]);
//     }
//   }
// }

function readURL() {

  var preview = document.querySelector('#img_upload');
  var deletePreview = document.querySelector('#img_delete');
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
        preview.appendChild( image );
      }, false);

      reader.readAsDataURL(file);
    }

  }

  if (files) {
    [].forEach.call(files, readAndPreview);
  }

}

