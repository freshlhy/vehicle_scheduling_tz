jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'new_form', :locals => {:note => @note}) %>")
  $("#form-wapper").show()
  $("#new_note").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')

