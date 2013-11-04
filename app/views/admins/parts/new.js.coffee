jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'new_form', :locals => {:part => @part}) %>")
  $("#form-wapper").show()
  $("#new_part").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')
