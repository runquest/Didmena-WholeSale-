$(function() { 

  $('#submit-login').on("click", function(event){
      var user_email = $("#email").val();
      var password = $("#password").val();
      var localization = $("body").data("locale");
      var login_data = {email: user_email, password: password}
      var header = document.getElementById("header");

      $.ajax({
        method: 'post',
        url: '/'+localization+'/sessions',
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        data: JSON.stringify(login_data),
        success: function (data) {
          location.reload();
        },
        error: function(err){
          document.getElementById("xButton").click(); 
          window.location.reload();
        }
      });
  });
});
