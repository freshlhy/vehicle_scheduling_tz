jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">新增出车地成功！</div>')
  $("#destinations").dataTable().fnDraw(true)
