jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'edit_form', :locals => {:note => @note}) %>")
  $("#form-wapper").show()
  $("#edit_note").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')
