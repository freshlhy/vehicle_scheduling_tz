jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">该司机已删除！</div>')
  $("#drivers").dataTable().fnDraw(true)

