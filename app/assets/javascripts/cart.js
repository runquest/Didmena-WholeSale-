$(function() {
  updateTotalCount();
  updateModelCost();
  updateTotalCost();
  updateAfterDiscount();

  var localization = $("body").data("locale");

  $('input').change(function() {
    updateTotalCount();
    updateModelCost();
    updateTotalCost();
  });

 $("div#confirm_order").click(function() {
    updateCart();
  });

  $("td.model_title").each(function() {
    var model_name_code = $(this).text().replace(/ /g,'').toLowerCase();
    $('div#'.concat('toggle_', model_name_code)).click(function(){
      $('tbody#'.concat('toggle_table_', model_name_code)).toggle();
    });
  })
});

function updateTotalCount() {
  $("td.model_title").each(function() {
    var classname = $(this).text().replace(/ /g,'').toLowerCase();
    var sum = 0;
    $('input.'.concat(classname)).each(function() {
      sum += Number($(this).val());
    })
    $('td#'.concat(classname)).text(sum);
  })
}

function updateCart() {

  var order_items = [];
  var order_amount_class_elements = document.getElementsByClassName("order-amount");
  var localization = $("body").data("locale");

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

  $.ajax({
    method: 'post',
    url: '/'+localization+'/update_cart',
    contentType: 'application/json; charset=utf-8',
    dataType: 'json',
    data: JSON.stringify(order_items),
    success: function (data) {
      console.log('success');
    },
    error: function(err){
      console.log(err);
    }
  });
}

function updateModelCost() {
  $("td.model_title").each(function() {
    var classname = $(this).text().replace(/ /g,'').toLowerCase();
    var price_span_classname = 'price_'.concat(classname);
    var cost_span_classname = 'cost_'.concat(classname);
    var price = $('td.'.concat(price_span_classname)).text();
    var units = $('td#'.concat(classname)).text();
    var total_model_cost =price * units;
    $('td.'.concat(cost_span_classname)).text(total_model_cost.toFixed(2));
  })
}

function updateTotalCost() {
  var cost = 0
  $('td.model_cost').each(function() {
    cost += Number($(this).text());
  })
  var total_amount = Math.round(cost * 100.00) / 100;
  $('div#total_cart_cost').text(total_amount.toFixed(2));
}

function updateTax() {

}

function updateAfterDiscount(total_model_cost) {
  var total_cost = $("div#total_cart_cost").text();
  var discount = $("div#discount").text();
  var afterDiscount = total_cost - discount;

  $('div#after_discount').text(afterDiscount.toFixed(2));

}