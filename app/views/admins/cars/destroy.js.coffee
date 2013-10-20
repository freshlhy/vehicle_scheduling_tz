jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">该车辆已删除！</div>')
  $("#cars").dataTable().fnDraw(true)

