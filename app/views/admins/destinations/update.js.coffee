jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">出差地名称修改成功！</div>')
  $("#destinations").dataTable().fnDraw(false)