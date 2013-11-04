jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">该部件已删除！</div>')
  $("#parts").dataTable().fnDraw(true)

