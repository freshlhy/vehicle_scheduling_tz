jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">新增事由成功！</div>')
  $("#notes").dataTable().fnDraw(true)
