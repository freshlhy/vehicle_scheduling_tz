jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">部件信息修改成功！</div>')
  $("#parts").dataTable().fnDraw(false)