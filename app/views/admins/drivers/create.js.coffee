jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">新增司机成功！</div>')
  $("#drivers").dataTable().fnDraw(true)
