jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">班组名称修改成功！</div>')
  $("#groups").dataTable().fnDraw(false)