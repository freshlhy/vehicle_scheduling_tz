jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">司机信息修改成功！</div>')
  $("#drivers").dataTable().fnDraw(false)