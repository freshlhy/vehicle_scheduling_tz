# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#encoding: utf-8

jQuery ->
  $('.chzn-select').chosen()
  $('.chzn-select-deselect').chosen({ allow_single_deselect:true })

  $('#supervises').dataTable
    sPaginationType: "bootstrap"
    bProcessing: true
    bServerSide: true
    "bStateSave": true
    sAjaxSource: $('#supervises').data('source')
    #排版
    "sDom": "<'span9'<'row'<'span3'l><'span1'T><'span1'r><'span4'f>>><'span9't><'span9'<'row'<'span5'i><'span4'p>>>"
    "aLengthMenu": [[10, 25, 50, 100, 200, 500, 1000, -1], [10, 25, 50, 100, 200, 500, 1000, "所有"]]
    #禁用七列排序
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": [ 6 ] }
    ]
    #首次打开默认以第4列排序
    "aaSorting": [[ 2, "desc" ]]

    "bAutoWidth": false,
    "aoColumns": [
      { "sWidth": "135px", "aTargets": [ 0 ] },
      { "sWidth": "120px", "aTargets": [ 1 ] },
      { "sWidth": "75px", "aTargets": [ 2 ] },
      { "sWidth": "65px", "aTargets": [ 3 ] },
      { "sWidth": "65px", "aTargets": [ 4 ] },
      { "sWidth": "30px", "aTargets": [ 5 ] },
      { "sWidth": "28px", "aTargets": [ 6 ] }
    ]
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

  $('#start').datepicker()
  $('#start').attr( 'readOnly', 'true' )




