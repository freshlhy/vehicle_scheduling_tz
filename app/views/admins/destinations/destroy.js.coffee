jQuery ->
  $("#form-wapper").hide()
  $("#alert-info").html('<div class="alert alert-success">该出差地已删除！</div>')
  $("#destinations").dataTable().fnDraw(true)

