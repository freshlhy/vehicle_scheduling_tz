jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">新增车辆成功！</div>')
  $("#cars").dataTable().fnDraw(true)
