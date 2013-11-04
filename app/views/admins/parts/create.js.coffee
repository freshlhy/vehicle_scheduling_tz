jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">新增部件成功！</div>')
  $("#parts").dataTable().fnDraw(true)

