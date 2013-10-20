jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">该事由已删除！</div>')
  $("#notes").dataTable().fnDraw(true)

