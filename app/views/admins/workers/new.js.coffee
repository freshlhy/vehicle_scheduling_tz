jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'new_form', :locals => {:worker => @worker}) %>")
  $("#form-wapper").show()
  $("#new_worker").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')

  $("#worker_password").val("000000")
  $("#worker_password_confirmation").val("000000")

  $("#password-group").hide()
  $("#password-confirmation-group").hide()

