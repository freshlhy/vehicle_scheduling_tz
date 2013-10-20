jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">新增班组成功！</div>')
  $("#groups").dataTable().fnDraw(true)
