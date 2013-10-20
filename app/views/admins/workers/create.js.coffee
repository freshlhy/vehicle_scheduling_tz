jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">新增工作人员成功！</div>')
  $("#workers").dataTable().fnDraw(true)
