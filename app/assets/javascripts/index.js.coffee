jQuery ->

	$('#plms').dataTable
    sPaginationType: "bootstrap"
    bProcessing: true
    bServerSide: true
    "bStateSave": true
    sAjaxSource: $('#plms').data('source')
    #排版
    "sDom": "<'span12'<'row'<'span3'l><'span1'T><'span4'r><'span4'f>>><'span12't><'span12'<'row'<'span6'i><'span6'p>>>"
    "aLengthMenu": [[10, 25, 50, 100, 200, 500, 1000, -1], [10, 25, 50, 100, 200, 500, 1000, "所有"]]
    #禁用七列排序
    "aoColumnDefs": [
      { "bSortable": false, "aTargets": [ 7 ] }
    ]
    #首次打开默认以第4列排序
    "aaSorting": [[ 5, "desc" ]]

    "bAutoWidth": false,
    "aoColumns": [
      { "sWidth": "95px", "aTargets": [ 0 ] },
      { "sWidth": "65px", "aTargets": [ 1 ] },
      { "sWidth": "55px", "aTargets": [ 2 ] },
      { "sWidth": "65px", "aTargets": [ 3 ] },
      { "sWidth": "70px", "aTargets": [ 4 ] },
      { "sWidth": "65px", "aTargets": [ 5 ] },
      { "sWidth": "55px", "aTargets": [ 6 ] },
      { "sWidth": "28px", "aTargets": [ 7 ] }
    ]
    "oTableTools": {
      "aButtons": [
        {
          "sExtends":    "xls",
          "sButtonText": "导出"
        }
      ]
    }

  $('#stats').dataTable
    sPaginationType: "bootstrap"
    bProcessing: true
    bServerSide: true
    "bStateSave": true
    sAjaxSource: $('#stats').data('source')
    #排版
    "sDom": "<'span12'<'row'<'span3'l><'span1'T><'span4'r><'span4'f>>><'span12't><'span12'<'row'<'span6'i><'span6'p>>>"
    "aLengthMenu": [[10, 25, 50, 100, 200, 500, 1000, -1], [10, 25, 50, 100, 200, 500, 1000, "所有"]]
    
    #首次打开默认以第4列排序
    "aaSorting": [[ 0, "desc" ]]

    "bAutoWidth": false,
    "aoColumns": [
      { "sWidth": "95px", "aTargets": [ 0 ] },
      { "sWidth": "65px", "aTargets": [ 1 ] },
      { "sWidth": "55px", "aTargets": [ 2 ] },
      { "sWidth": "65px", "aTargets": [ 3 ] },
      { "sWidth": "70px", "aTargets": [ 4 ] },
      { "sWidth": "65px", "aTargets": [ 5 ] }
    ]
    "oTableTools": {
      "aButtons": [
        {
          "sExtends":    "xls",
          "sButtonText": "导出"
        }
      ]
    }
