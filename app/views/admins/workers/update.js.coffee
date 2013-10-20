jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">工作人员信息修改成功！</div>')
  $("#workers").dataTable().fnDraw(false)