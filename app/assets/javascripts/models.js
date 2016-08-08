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
          alert('add color to the db');

        } else if ($("#colors").val().length == 0) {
          alert("select color");  

        } else if (document.getElementById($("#colors").val())) {
          alert("color is already added");

        } else {
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
            
            for (k = 0; k < sizes.length; k++) {
              var checkbox = "<td><input type='checkbox' class='size' id='"+ value + "-" + sizes[k] +"'><label for='"+ value + "-" + sizes[k] +"'></label></td>";
              $("tr#" + value).append(checkbox);
            }
          }

          for (j = 0; j < rows.length; j++) {
            rowColors.push(rows[j].id);
          };

          for (i = 0; i < sizes.length; i++) {
            var product_data = {color: value, size: sizes[i], model: model_id, in_storage: false};
            products.push(product_data);
          }

          $("#colors").val('');
        }
      }
    });
  });

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
}

