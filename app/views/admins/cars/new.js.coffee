jQuery ->
  $("#form-wapper").html("<%= j render(:partial => 'new_form', :locals => {:car => @car}) %>")
  $("#form-wapper").show()
  $("#new_car").enableClientSideValidations()
  $(".cancle").click ->
    $("#form-wapper").hide()

  $("#alert-info").html('')

  $('#input_new_car_since').datepicker()
  $('#input_new_car_since').attr('readOnly', 'true')

