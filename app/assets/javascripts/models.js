$(function() {

  function isInArray(value, array) {
    return array.indexOf(value) > -1;
  }

  var localization = $("body").data("locale");

  var options = {
    url: "/cls.json",

      getValue: "meaning",

      template: {
          type: "description",
          fields: {
              description: "code_value"
          }
      },

      list: {
          match: {
              enabled: true
          },
          sort: {
            enabled: true
          }
      },

      theme: "plate-dark"
  };

  $("#colors").easyAutocomplete(options);
            console.log(options);

  $('#add_color').on("click", function(event){

    $.ajax({
      url: '/'+localization+'/cls.json',
      cache: false,
      success: function(data){

        var selected_color = $("#colors").val();
        var colors = [];

        for (var i = 0; i < data.length; ++i) {
          var color = data[i].meaning;
          colors.push(color);
        }

        if (colors.indexOf(selected_color) < 0) {
          alert('Add color to database.');

        } else if ($("#colors").val().length == 0) {
          alert("Select color");  

        } else if (document.getElementById($("#colors").val())) {
          alert("Color is already added to product.");

        } else {
          // console.log(selected_color);
          addProduct();
        }
      }
    });
  });

  function addProduct() {

    var selected_color = $("#colors").val();
    var rows = document.getElementById("colorSize").rows;
    var str = window.location.href;
    var n = str.match(/\/(\d+)\//);
    var model_id = n[1];
    var products = [];
    var rowColors = [];
    var value = $("#colors").val().toUpperCase();

    var sizes = [];

    var color_row = "<tr id='" + value +"'><td style='background-color: #" + value + "; width=5px;'><td style='padding-left: 5px;'>" + value + "</td></tr>";
    $("tbody#color_row").append(color_row);

    $.ajax({
      url: '/'+localization+'/sizes',
      cache: false,
      success: function(data){
        getSizes(data);
      }
    });

    function getSizes(data) {
      for (var i = 0; i < data.length; ++i) {
        var size = data[i].code_value;
        sizes.push(size);
      }
      
      for (var k = 0; k < sizes.length; k++) {
        var checkbox = "<td><input type='checkbox' class='size' id='"+ value + "-" + sizes[k] +"'><label for='"+ value + "-" + sizes[k] +"'></label></td>";
        $("tr#" + value).append(checkbox);
      }

      for (var j = 0; j < rows.length; j++) {
        rowColors.push(rows[j].id);
      };

      for (var i = 0; i < sizes.length; i++) {
        var product_data = {color: value, size: sizes[i], model: model_id, in_storage: false};
        // console.log(product_data);
        products.push(product_data);
      }

      for (var j = 0; j < rows.length; j++) {
        rowColors.push(rows[j].id);
      };

      $.ajax({
        method: 'post',
        url: '/'+localization+'/products',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: JSON.stringify(products),
        success: function (data) {
          // console.log(data);
        },
        error: function(err){
          // console.log(err);
        }
      });
    }
    

    

    $("#colors").val('');
  }

  $("tbody#color_row").on("click", ".size", function() { 

    var rows = document.getElementById("colorSize").rows;
    var str = window.location.href;
    var n = str.match(/\/(\d+)\//);
    var model_id = n[1];

    var color = this.id.match(/(\w+)/);
    var size = this.id.match(/\w+$/);

    console.log('here');

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

    
    
    // if (order_items.length > 0) {
      
    //   $.ajax({
    //     method: 'post',
    //     url: '/'+localization+'/cart',
    //     contentType: 'application/json; charset=utf-8',
    //     dataType: 'json',
    //     data: JSON.stringify(order_items),
    //     success: function (data) {
    //       console.log('success');
    //       window.location = '/'+localization+'/cart'
    //     },
    //     error: function(err){
    //       window.location = '/'+localization+'/cart'
    //       // to-do: it is not hitting success function even though it posts well.
    //     }
    //   });
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
}

