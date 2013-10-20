jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">车辆信息修改成功！</div>')
  $("#cars").dataTable().fnDraw(false)