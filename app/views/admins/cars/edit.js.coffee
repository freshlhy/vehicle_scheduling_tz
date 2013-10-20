jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'edit_form', :locals => {:car => @car}) %>")
  $("#form-wapper").show()
  $("#edit_car").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')
