# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#encoding: utf-8

jQuery ->

  $('#workers').dataTable
    sPaginationType: "bootstrap"
    "bProcessing": true
    "bServerSide": true
    "bStateSave": true
    sAjaxSource: $('#workers').data('source')
    #排版
    #"sDom": "<'span6'<'row'<'span3'l><'span1'r><'span2'f>>><'span6't><'span6'<'row'<'span3'i><'span3'p>>>"
    "sDom": "<'span6'<'row'<'span2'l><'span1'T><'span1'r><'span2'f>>><'span6't><'span6'<'row'<'span3'i><'span3'p>>>"

    "aaSorting": [[ 1, "asc" ]]

    "bAutoWidth": false
    "aoColumns": [
      { "mData": "name" },
      { "mData": "group" },
    ]
    "oTableTools": {
      "sRowSelect": "single"
      "fnRowSelected": ( node ) ->
        $('#edit_admins_worker').attr('href','/admins/workers/'+node.id+'/edit')
        $('#delete_admins_worker').attr('href','/admins/workers/'+node.id)
        $("#alert-info").html('')
      "fnRowDeselected": (node) ->
        $('#edit_admins_worker').attr('href','#')
        $('#delete_admins_worker').attr('href','#')
        $("#alert-info").html('')
      "aButtons": [
        {
          "sExtends":    "xls",
          "sButtonText": "导出"
        }
      ]
    }

  $(".cancle").click ->
    $("#form-wapper").hide()


  $("#alert-info").html('')


