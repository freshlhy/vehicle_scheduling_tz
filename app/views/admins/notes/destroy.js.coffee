jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">该用途已删除！</div>')
  $("#notes").dataTable().fnDraw(true)

