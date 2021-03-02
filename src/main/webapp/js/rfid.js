/**
 * Created by Administrator on 2017/7/6.
 */
var ret_data = '';
function readcard(type) {
    var qsData = { 'msg': type, 'context': '' };
    $.ajax({
        async: false,
        url: 'http://127.0.0.1:5678/readcard',
        type: 'GET',
        dataType: 'jsonp',
        jsonp: 'jsoncallback',
        data: qsData,
        // timeout: 30,
        success: function (data) {
            // alert(data);
            //cardValue需要修改成对应的id
            //if (type == "ConnRead") {
            //    document.getElementById("cardConn").value = data;
            //}
            //else if (type == "CloseRead") {
            //    document.getElementById("cardClose").value = data;
            //}
            //$('#obj_epc').textbox('setValue', data);



        },
        error: function (xhr) {
            alert("出错：" + xhr);
        },
        complete: function (XMLHttpRequest, textStatus) {
            //$.unblockUI(fadeOut: 10);
        }
    });
}
function writecard(wdata) {
    //	var qsData = {'msg':'writecard-1-0-8-abcdefgh'};
    // var wdata = document.getElementById("cardValueW").value;
    //			var qsData = {'msg':'writecard-'+type+'-'+offset+'-'+wdata.length+'-'+ wdata};
    var qsData = { 'msg': 'writecard', 'context': wdata };
    $.ajax({
        async: false,
        url: 'http://127.0.0.1:5678/writecard',
        type: 'GET',
        dataType: 'jsonp',
        jsonp: 'jsoncallback',
        data: qsData,
        // timeout: 1000,
        success: function (data) {
            //cardValue需要修改成对应的id
            //document.getElementById("cardValueW").value = data;

            // ret_data = data;
            $('#obj_epc').textbox('setValue', data);
        },
        error: function (xhr) {
            alert("出错：" + xhr);
        },
        complete: function (XMLHttpRequest, textStatus) {
            //$.unblockUI(fadeOut: 10);
            // alert("aaa");
        }
    });
}

function SysncUserData() {

    var qsData = { 'msg': 'TID', 'context': wdata };
    $.ajax({
        async: false,
        url: 'http://127.0.0.1:5678/tid',
        type: 'GET',
        dataType: 'jsonp',
        jsonp: 'jsoncallback',
        data: qsData,
        timeout: 1000,
        success: function (data) {
            //cardValue需要修改成对应的id
            //document.getElementById("cardValueW").value = data;
            // alert(data);
            // ret_data = data;
            $('#obj_epc').textbox('setValue', data);
        },
        error: function (xhr) {
            alert("出错：" + xhr);
        },
        complete: function (XMLHttpRequest, textStatus) {
            //$.unblockUI(fadeOut: 10);
            // alert("aaa");
        }
    });
}