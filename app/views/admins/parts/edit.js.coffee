jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'edit_form', :locals => {:part => @part}) %>")
  $("#form-wapper").show()
  $("#edit_part").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')
