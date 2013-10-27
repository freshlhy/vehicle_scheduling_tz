jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">新增用途成功！</div>')
  $("#notes").dataTable().fnDraw(true)
