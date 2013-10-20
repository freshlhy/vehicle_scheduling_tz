jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'edit_form', :locals => {:destination => @destination}) %>")
  $("#form-wapper").show()
  $("#edit_destination").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')
