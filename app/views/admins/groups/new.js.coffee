jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'new_form', :locals => {:group => @group}) %>")
  $("#form-wapper").show()
  $("#new_group").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')

