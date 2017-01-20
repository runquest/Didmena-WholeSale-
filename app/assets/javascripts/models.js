$(function() {
  var localization = $("body").data("locale");
  var url = window.location.href;

  function getModelId() {
    if (url.match(/\/(\d+)\//)) {
      return (url.match(/\/(\d+)\//))[1];
    }
  }
  // Edit page.

  $('div.color_element').on('click', function(event) {
    var selected_color_id = this.id;
    var color_element = document.getElementById(this.id);
    var selected_color_hex_code = color_element.children[1].innerText;
    var selected_color_name = color_element.children[2].innerText;
    createTableRowForSelectedColor(selected_color_id, selected_color_hex_code, selected_color_name);
  });

  function createTableRowForSelectedColor(color_id, color_hex_code, color_name) {
    var row = "'<tr id='row_" + color_id + "'></tr> ";
    var color_indication_circle = "'<td style='background-color: " + color_hex_code + "; width=5%;'></td> ";
    var color_name_cell = "<td>" + color_name + "</td>";
    var new_row = ("tr#row_" + color_id).toString();
    var delete_row_icon = "<td class='del' id='delete_" + color_id + "'>x</td>";

    $('tbody#color_row').prepend(row);
    $(new_row).append(color_indication_circle);
    $(new_row).append(color_name_cell);
    $('th.size').each(function(  ) {
      var size_id = this.id;
      var checkbox_id = color_id + "-" + size_id;
      var checkbox = "<td><input type='checkbox' class='size' id='"+ checkbox_id +"'><label for='"+ checkbox_id +"'></label></td>";
      $(new_row).append(checkbox);
      createProduct(getModelId(), color_id, size_id);
    });
    $(new_row).append(delete_row_icon);
  }

  $('tr td.del').on('click', function(event) {
    var color_id = this.id.split('_')[1];
    var send_data = {model: getModelId(), color: color_id};
    var delete_row = ("tr#row_" + color_id).toString();
    console.log('before ajax delete_row: ' + delete_row);

    $.ajax({
      method: 'post',
      url: '/'+localization+'/delete_products',
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      data: JSON.stringify(send_data),
      success: function (data) {
        console.log("success");
        console.log("delete_row: " + delete_row);
        // remove row from 
      },
      error: function(err){
        console.log("failure");
        $(delete_row).remove();
      }
    });
  });

  function createProduct(model_id, color_id, size_id) {
    var product_data = {model: model_id, color: color_id, size: size_id, in_storage: false};
    $.ajax({
      method: 'post',
      url: '/'+localization+'/products',
      contentType: 'application/json; charset=utf-8',
      dataType: 'json',
      data: JSON.stringify(product_data),
      success: function (data) {
        console.log("Products created successfully: " + data);
      },
      error: function(err){
        console.log("Products failed to be created: " + err);
      }
    });
  }

  $("tbody#color_row").on("click", ".size", function() { 
    var color_id = this.id.match(/(\w+)/)[1];
    var size_id = this.id.split('-')[1];
    var model_id = getModelId();
    if (this.checked) {
      var product_data = {model: model_id, color: color_id, size: size_id, in_storage: true};
    } else {
      var product_data = {model: model_id, color: color_id, size: size_id, in_storage: false};
    }
    
    $.ajax({
      method: 'put',
      url: '/'+localization+'/update_product',
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

  // Show page.

  $("#order-btn").on('click', function() {
    var order_items = [];
    var order_amount_class_elements = document.getElementsByClassName("order-amount");
    for (var i=0; i<order_amount_class_elements.length; i++ ) {

      var box = order_amount_class_elements[i].getElementsByTagName('input');
      var product_id = box[0].value
      var amount = box[1].value;
        if (amount != null && amount != "") {
          var item = {};
          item[product_id] = amount;
          order_items.push(item);
        }
    }
    
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
      alert("No products selected.");
    }
  });
});

// Image attachements.

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