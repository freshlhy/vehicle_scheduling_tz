# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#encoding: utf-8

jQuery ->
  $('.chzn-select').chosen()
  $('.chzn-select-deselect').chosen({ allow_single_deselect:true })

  $('#trips').dataTable
    sPaginationType: "bootstrap"
    bProcessing: true
    bServerSide: true
    "bStateSave": true
    sAjaxSource: $('#trips').data('source')
    #排版
    "sDom": "<'span9'<'row'<'span3'l><'span1'T><'span1'r><'span4'f>>><'span9't><'span9'<'row'<'span5'i><'span4'p>>>"
    "aLengthMenu": [[10, 25, 50, 100, 200, 500, 1000, -1], [10, 25, 50, 100, 200, 500, 1000, "所有"]]
    #禁用第一列排序
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": [ 0 ] },
      { "bSortable": false, "aTargets": [ 5 ] }
    ]
    #首次打开默认以第六列排序
    "aaSorting": [[ 3, "desc" ]]

    "bAutoWidth": false,
    "oTableTools": {
      "aButtons": [
        {
          "sExtends":    "xls",
          "sButtonText": "导出"
        }
      ]
    }

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

  $('#inputDeparture_time').datepicker()
  $('#inputDeparture_time').attr( 'readOnly', 'true' )

  $('#inputBack_time').datepicker()
  $('#inputBack_time').attr( 'readOnly', 'true' )

  #根据所选班组对optgroup重排
  $("#chzn-group-select").chosen().change ->
    #alert $("#chzn-worker-select").val()
    $sel = $("#chzn-worker-select")
    val = $(this).val()
    group =  $('option:selected', this).text()
    $('span > optgroup', $sel).unwrap()
    if val isnt '%'
      $('optgroup:not([label="' + group + '"])', $sel).appendTo($sel)
    #chosen属性 选项更新
    $sel.trigger("liszt:updated")


