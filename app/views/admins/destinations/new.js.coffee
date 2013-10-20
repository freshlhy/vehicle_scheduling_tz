jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'new_form', :locals => {:destination => @destination}) %>")
  $("#form-wapper").show()
  $("#new_destination").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')

