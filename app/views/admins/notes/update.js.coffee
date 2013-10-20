jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">事由名称修改成功！</div>')
  $("#notes").dataTable().fnDraw(false)