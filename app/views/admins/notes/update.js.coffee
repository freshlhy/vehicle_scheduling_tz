jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">用途名称修改成功！</div>')
  $("#notes").dataTable().fnDraw(false)