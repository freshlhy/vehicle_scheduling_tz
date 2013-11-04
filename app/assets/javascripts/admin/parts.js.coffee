# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#encoding: utf-8

jQuery ->

  $('#parts').dataTable
    sPaginationType: "bootstrap"
    "bProcessing": true
    "bServerSide": true
    "bStateSave": true
    sAjaxSource: $('#parts').data('source')
    #排版
    #"sDom": "<'span6'<'row'<'span3'l><'span1'r><'span2'f>>><'span6't><'span6'<'row'<'span3'i><'span3'p>>>"
    "sDom": "<'span6'<'row'<'span2'l><'span1'T><'span1'r><'span2'f>>><'span6't><'span6'<'row'<'span3'i><'span3'p>>>"

    #首次打开默认以第六列排序
    "aaSorting": [[ 0, "asc" ]]

    "bAutoWidth": false

    "aoColumns": [
      { "mData": "name" },
      { "mData": "model" },
      { "mData": "rating_mileage" },
      { "mData": "rating_life" }
    ]

    "oTableTools": {
      "sRowSelect": "single"
      "fnRowSelected": ( node ) ->
        $('#edit_admins_part').attr('href','/admins/parts/'+node.id+'/edit')
        $('#delete_admins_part').attr('href','/admins/parts/'+node.id)
        $("#alert-info").html('')
      "fnRowDeselected": (node) ->
        $('#edit_admins_part').attr('href','#')
        $('#delete_admins_part').attr('href','#')
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

  $(".submit").click ->
    $("#new_part").submit()


  $("#alert-info").html('')


  $.datepicker.regional['zh-CN'] = {
    closeText: '关闭',
    prevText: '<上月',
    nextText: '下月>',
    currentText: '今天',
    monthNames: ['一月','二月','三月','四月','五月','六月',
      '七月','八月','九月','十月','十一月','十二月'],
    monthNamesShort: ['一','二','三','四','五','六',
      '七','八','九','十','十一','十二'],
    dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'],
    dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'],
    dayNamesMin: ['日','一','二','三','四','五','六'],
    weekHeader: '周',
    dateFormat: 'yy-mm-dd',
    firstDay: 1,
    isRTL: false,
    showMonthAfterYear: true,
    yearSuffix: '年'
  }

  $.datepicker.setDefaults($.datepicker.regional['zh-CN'])





