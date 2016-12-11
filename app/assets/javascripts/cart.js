$(function() {
  updateTotalCount();
  updateModelCost();
  updateTotalCost();

  var localization = $("body").data("locale");

  $('input').change(function() {
    updateTotalCount();
    updateModelCost();
    updateTotalCost();
    // updateCart();
  });

 $("button#confirm_order").click(function() {
    updateCart();

 //    var order_items = [];
 //    var order_amount_class_elements = document.getElementsByClassName("order-amount");

 //    for (var i=0; i<order_amount_class_elements.length; i++ ) {
 //      var box = order_amount_class_elements[i].getElementsByTagName('input');
 //      var product_id = box[0].value
 //      var amount = box[1].value;
 //      if (amount != null && amount != "" && amount !== "0") {
 //        var item = {};
 //        item[product_id] = amount;
 //        order_items.push(item);
 //      }
 //    }

    // if (order_items.length > 0) {
    //   $.ajax({
    //     method: 'post',
    //     url: '/'+localization+'/purchases',
    //     contentType: 'application/json; charset=utf-8',
    //     dataType: 'json',
    //     data: JSON.stringify(order_items),
    //     success: function (data) {
    //       console.log('success');
    //       console.log(data);
    //       window.location = '/'+localization+'/orders/4'
    //     },
    //     error: function(err){
    //                 console.log(err);

    //       window.location = '/'+localization+'/orders/4'
    //       // to-do: it is not hitting success function even though it posts well.
    //     }
    //   });
    // } else {
    //   alert("No products selected.");
    // }
  });

  $("span.model_title").each(function() {
    var model_name_code = $(this).text().replace(/ /g,'').toLowerCase();
    $('div#'.concat('toggle_', model_name_code)).click(function(){
      $('tbody#'.concat('toggle_table_', model_name_code)).toggle();
    });
  })
});

function updateTotalCount() {
  $("span.model_title").each(function() {
    var classname = $(this).text().replace(/ /g,'').toLowerCase();
    var sum = 0;
    $('input.'.concat(classname)).each(function() {
      sum += Number($(this).val());
    })
    $('span.'.concat(classname)).text(sum);
  })
}

function updateCart() {

    console.log('updating cart');

    var order_items = [];
    var order_amount_class_elements = document.getElementsByClassName("order-amount");

    for (var i=0; i<order_amount_class_elements.length; i++ ) {
      var box = order_amount_class_elements[i].getElementsByTagName('input');
      var product_id = box[0].value
      var amount = box[1].value;
      if (amount != null && amount != "" && amount !== "0") {
        var item = {};
        item[product_id] = amount;
        order_items.push(item);
      }
    }

  var localization = $("body").data("locale");

    $.ajax({
        method: 'post',
        url: '/'+localization+'/update_cart',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: JSON.stringify(order_items),
        success: function (data) {
          console.log('success');
          // console.log(data);
          // window.location = '/'+localization+'/cart'
        },
        error: function(err){
                    console.log(err);

          // window.location = '/'+localization+'/orders/4'
          // to-do: it is not hitting success function even though it posts well.
        }
      });



// '/update_cart'


}


function updateModelCost() {
  $("span.model_title").each(function() {
    var classname = $(this).text().replace(/ /g,'').toLowerCase();
    var price_span_classname = 'price_'.concat(classname);
    var cost_span_classname = 'cost_'.concat(classname);
    var price = $('span.'.concat(price_span_classname)).text();
    var total_count = $('span.'.concat(classname)).text();
    var total_model_cost = Math.round(price * total_count * 100) / 100;
    $('span.'.concat(cost_span_classname)).text(total_model_cost);
  })
}

function updateTotalCost() {
  var cost = 0
  $('span.model_cost').each(function() {
    cost += Number($(this).text());
  })
  var total_amount = Math.round(cost * 100.00) / 100;
  $('span#total_cart_cost').text(total_amount.toFixed(2));
}
