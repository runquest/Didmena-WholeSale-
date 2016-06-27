$(function() {

  function isInArray(value, array) {
    return array.indexOf(value) > -1;
  }

  var localization = $("body").data("locale");

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
        var rowColors = [];

        var checkbox = "<tr id='" + value + "'><td style='background-color: #" + value + "; width=5px;'></td><td style='padding-left:5px' >" + value + "</td><td><input type='checkbox' class='size' id='"+ value + "-XL" +"'><label for='"+ value + "-XL" +"'></label></td><td><input type='checkbox' class='size' id='"+ value + "-L" +"'><label for='"+ value + "-L" +"'></label></td><td><input class='size' type='checkbox' id='"+ value + "-M" +"'><label for='"+ value + "-M" +"'></label></td><td><input type='checkbox' class='size' id='"+ value + "-S" +"'><label for='"+ value + "-S" +"'></label></td><td><input type='checkbox' class='size'  id='"+ value + "-XS" +"'><label for='"+ value + "-XS" +"'></label></td><td><a id='"+ value +"' href='' onclick='removeColor(this)'>Remove</a></td></tr>";
        var sizes = ['XL', 'L', 'M', 'S', 'XS'];

        for (j = 0; j < rows.length; j++) {
            rowColors.push(rows[j].id);
        };

        if (!rowColors.includes(value)) {

          $("tbody#color_row").append(checkbox);

          for (i = 0; i < sizes.length; i++) {
            var product_data = {color: value, size: sizes[i], model: model_id, in_storage: false};
            products.push(product_data);
          }

          $.ajax({
            method: 'post',
            url: '/'+localization+'/products',
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

          $("#color_box").val('');
        } else {
          alert('color exist');
        };
      }
    }
  });

  $('#add_color').on("click", function(event){
    // var keycode = (event.keyCode ? event.keyCode : event.which);
    if (null != $("#color_box").val()) {

      // if(keycode == '13'){
        var value = $("#color_box").val().toUpperCase();
        var rows = document.getElementById("colorSize").rows;

        var str = window.location.href;
        var n = str.match(/\/(\d+)\//);
        var model_id = n[1];
        var products = [];
        var rowColors = [];

        var checkbox = "<tr id='" + value + "'><td style='background-color: #" + value + "; width=5px;'><td style='padding-left: 5px;'>" + value + "</td><td><input type='checkbox' class='size' id='"+ value + "-XL" +"'><label for='"+ value + "-XL" +"'></label></td><td><input type='checkbox' class='size' id='"+ value + "-L" +"'><label for='"+ value + "-L" +"'></label></td><td><input class='size' type='checkbox' id='"+ value + "-M" +"'><label for='"+ value + "-M" +"'></label></td><td><input type='checkbox' class='size' id='"+ value + "-S" +"'><label for='"+ value + "-S" +"'></label></td><td><input type='checkbox' class='size'  id='"+ value + "-XS" +"'><label for='"+ value + "-XS" +"'></label></td><td><a id='value' href='' onclick='removeColor(this)'>Remove</a></td></tr>";
        // var checkbox = "<tr id='" + value + "'><td>" + value + "</td><td><input type='checkbox' class='size' id='"+ value + "-XL" +"'><label for='"+ value + "-XL" +"'></label></td><td><input type='checkbox' class='size' id='"+ value + "-L" +"'><label for='"+ value + "-L" +"'></label></td><td><input class='size' type='checkbox' id='"+ value + "-M" +"'><label for='"+ value + "-M" +"'></label></td><td><input type='checkbox' class='size' id='"+ value + "-S" +"'><label for='"+ value + "-S" +"'></label></td><td><input type='checkbox' class='size'  id='"+ value + "-XS" +"'><label for='"+ value + "-XS" +"'></label></td><td><a href='' onclick='javascript:tbody#color_row.removeChild(tbody#color_row.childNodes[0])'>Remove</a></td></tr>";
        var sizes = ['XL', 'L', 'M', 'S', 'XS'];

        for (j = 0; j < rows.length; j++) {
            rowColors.push(rows[j].id);
        };

        if (!rowColors.includes(value)) {

          $("tbody#color_row").append(checkbox);

          for (i = 0; i < sizes.length; i++) {
            var product_data = {color: value, size: sizes[i], model: model_id, in_storage: false};
            products.push(product_data);
          }

          $.ajax({
            method: 'post',
            url: '/'+localization+'/products',
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

          $("#color_box").val('');
        } else {
          alert('color exist');
        };
      // }
    }
  });

  $('td#remove').on('click', function() {
    console.log(this);
    // tbody#color_row.removeChild(tbody#color_row.childNodes[0]);

    // var row = document.getElementById(rowid);
    // row.parentNode.removeChild(row);

    // javascript:tbody#color_row.removeChild(tbody#color_row.childNodes[0])
  });



  /// creating selectors
  $("tbody#color_row").on("click", ".size", function() { 

    var rows = document.getElementById("colorSize").rows;
    var str = window.location.href;
    var n = str.match(/\/(\d+)\//);
    var model_id = n[1];

    var color = this.id.match(/(\w+)/);
    var size = this.id.match(/\w+$/);

    if (this.checked) {
      var product_data = {model: model_id, color: color, size: size, in_storage: true};
    } else {
      var product_data = {model: model_id, color: color, size: size, in_storage: false};
    }

    $.ajax({
      method: 'put',
      url: '/'+localization+'/products_update',
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      data: JSON.stringify(product_data),
      success: function(data) {
        window.location = '/'+localization+'/models/' + model_id
      },
      error: function(err){
        console.log(err);
      }
    });           
  });

  $(".order_button").on('click', function() {

    var order_items = [];

    var rowsNumber = $("#product_table tr").length;

    for (var i = 1; i < rowsNumber; i++) {
      var row = $("#product_table tr")[i];

      for (var j = 2; j < row.children.length; j++) {

          var quantity = $("#product_table tr")[i].children[j].getElementsByTagName("input")[1].value
          
          if (!!quantity) {
            if (quantity < 0) {
              alert('You cannot order negative number of products');
              return false;
            } else {

              var product_id = $("#product_table tr")[i].children[j].getElementsByTagName("input")[0].value

              var item_data = {product_id: product_id, quantity: quantity}
              order_items.push(item_data);
            };
          }
      };
    };

    if (order_items.length > 0) {
      
      $.ajax({
        method: 'post',
        url: '/'+localization+'/cart',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: JSON.stringify(order_items),
        success: function (data) {
          console.log('success');
          window.location = '/'+localization+'/cart'
        },
        error: function(err){
          window.location = '/'+localization+'/cart'
          // to-do: it is not hitting success function even though it posts well.
        }
      });

    } else {
      alert('No product selected');
    };
  });
});

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

function removeColor(some) {

      var str = window.location.href;
      var n = str.match(/\/(\d+)\//);
      var model_id = n[1];
      var color_name = some.id

      var products_data = {color_name: color_name, model_id: model_id}

      $.ajax({
        method: 'post',
        url: '/'+localization+'/delete_products',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: JSON.stringify(products_data),
        success: function (data) {
          console.log('success');
          window.location = '/'+localization+'/models/' + model_id
        },
        error: function(err){
          console.log(err);
          // to-do: it is not hitting success function even though it posts well.
        }
      });

    // tbody#color_row.removeChild(tbody#color_row.childNodes[0]);

    // var row = document.getElementById(rowid);
    // row.parentNode.removeChild(row);

    // javascript:tbody#color_row.removeChild(tbody#color_row.childNodes[0])
}

