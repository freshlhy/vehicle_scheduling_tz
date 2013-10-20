jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'edit_form', :locals => {:group => @group}) %>")
  $("#form-wapper").show()
  $("#edit_group").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')
