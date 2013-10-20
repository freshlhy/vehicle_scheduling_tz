jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">该工作人员已删除！</div>')
  $("#workers").dataTable().fnDraw(true)

