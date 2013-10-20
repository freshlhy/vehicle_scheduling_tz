jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">该班组已删除！</div>')
  $("#groups").dataTable().fnDraw(true)

