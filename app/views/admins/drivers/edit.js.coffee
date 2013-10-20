jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'edit_form', :locals => {:driver => @driver}) %>")
  $("#form-wapper").show()
  $("#edit_driver").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')

  $("#driver_password").val("000000")
  $("#driver_password_confirmation").val("000000")

  $("#password-group").hide()
  $("#password-confirmation-group").hide()
