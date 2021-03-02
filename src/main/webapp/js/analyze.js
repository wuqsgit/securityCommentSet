/**
 * Created by 706 on 2017/7/7.
 */
function createJson(jsonObj, prop, val) {
    // 如果 val 被忽略
    if(typeof val === "undefined") {
        // 删除属性
        delete jsonObj[prop];
    }
    else {
        // 添加 或 修改
        jsonObj[prop] = val;
    }
}



function newlayer(title,content){
    layer.open({
        type: 1,
        title:title,
        shadeClose: false,
        offset:'0px',
        shade:0,
        offset:'0px',
        area: ['100%', '100%'],
        content: $(content),
        btn: ['关闭'],
        btnAlign: 'c', //按钮居中
        yes: function (index) {
            layer.close(index);
        },
        btn2: function (index) {

        },success:function (layero,index) {

        },cancel:function(index){
            layer.close();
        }
    });
}
var myMonth = new Date().getMonth()+1;
function operationFunc(paramEntity, operatePath, callbackFunc)
{
    var paramEntity=paramEntity;
    $.ajax({
        async : false,
        type : 'post',
        url : operatePath,
        data: {
            "page": JSON.stringify(
                {
                    "paramEntity": paramEntity
                }
            )
        },
        error : function(result) {
            callbackFunc(result);
        },
        success : function(result) {
            callbackFunc(result);
        }
    });
}
//清点
function getDeptMonthTopTenLateWorker() {
    var applicationList;
    var paramEntity = {};
    var depttoplateworkers = new Array();
    var depttoplatetimes = new Array();
    var depttoplateworkers1 = new Array();
    var depttoplatetimes1 = new Array();

    var maxy = 0;
    var maxy1 = 0;

    operationFunc(paramEntity, "/Invent/selectuncomnum.action", function (result) {
        var re = result;
        applicationList = re.list;
        var i=0;

        //if(applicationList.length==0){
        //    for (var a = 0; a < myMonth; a++){
        //        var depttoplateworker = a+1;
        //        var depttoplatetime = 0;
        //        depttoplateworkers[a] = depttoplateworker;
        //        depttoplatetimes[a] = depttoplatetime;
        //    }
        //}
        //else{
        //    for (var a = 0; a < myMonth; a++) {
        //        if(applicationList[a].month!=a+1){
        //            var depttoplateworker = a+1;
        //            var depttoplatetime = 0;
        //            depttoplateworkers[a] = depttoplateworker;
        //            depttoplatetimes[a] = depttoplatetime;
        //        }
        //        else{
        //            var depttoplateworker = applicationList[a].month;
        //            var depttoplatetime = applicationList[a].noncompleteNum;
        //            depttoplateworkers[a] = depttoplateworker;
        //            depttoplatetimes[a] = depttoplatetime;
        //            i++;
        //        }
        //
        //
        //    }
        //}


        if(applicationList!=null){
            for (var a = 0; a < applicationList.length; a++){
                var depttoplateworker = applicationList[a].month;
                var depttoplatetime = applicationList[a].noncompleteNum;
                depttoplateworkers[applicationList[a].month-1] = depttoplateworker;
                depttoplatetimes[applicationList[a].month-1] = depttoplatetime;

            }
        }

        for (var a = 0; a < myMonth; a++) {
            if(depttoplateworkers[a]==null){
                var depttoplateworker = a+1;
                var depttoplatetime = 0;
                depttoplateworkers[a] = depttoplateworker;
                depttoplatetimes[a] = depttoplatetime;
            }
        }

        maxy = Math.max.apply(null,depttoplatetimes);
        if(maxy1>maxy)maxy = maxy1;
        if(maxy<=5)maxy=5;


    });
    operationFunc(paramEntity, "/Invent/selectcomnum.action", function (result) {
        var re = result;
        applicationList = re.list;
        var i=0;
        //if(applicationList.length==0){
        //    for (var a = 0; a < myMonth; a++){
        //        var depttoplateworker = a+1;
        //        var depttoplatetime = 0;
        //        depttoplateworkers[a] = depttoplateworker;
        //        depttoplatetimes[a] = depttoplatetime;
        //    }
        //}
        //for (var a = 0; a < myMonth; a++) {
        //    if(applicationList[a].month!=a+1){
        //        var depttoplateworker = a+1;
        //        var depttoplatetime = 0;
        //        depttoplateworkers1[a] = depttoplateworker;
        //        depttoplatetimes1[a] = depttoplatetime;
        //    }
        //    else{
        //        var depttoplateworker = applicationList[a].month;
        //        var depttoplatetime = applicationList[a].completeNum;
        //        depttoplateworkers1[a] = depttoplateworker;
        //        depttoplatetimes1[a] = depttoplatetime;
        //        i++;
        //    }
        //}
        if(applicationList!=null){
            for (var a = 0; a < applicationList.length; a++){
                var depttoplateworker = applicationList[a].month;
                var depttoplatetime = applicationList[a].completeNum;
                depttoplateworkers1[applicationList[a].month-1] = depttoplateworker;
                depttoplatetimes1[applicationList[a].month-1] = depttoplatetime;

            }
        }

        for (var a = 0; a < myMonth; a++) {
            if(depttoplateworkers1[a]==null){
                var depttoplateworker = a+1;
                var depttoplatetime = 0;
                depttoplateworkers1[a] = depttoplateworker;
                depttoplatetimes1[a] = depttoplatetime;
            }
        }
        maxy1 = Math.max.apply(null,depttoplatetimes1);
        if(maxy1<=5)maxy1=5;
        if(maxy1>maxy)maxy = maxy1;
    });

    option = {
        title : {
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['未完成数量','已完成数量']
        },
        toolbox: {
            orient: 'vertical',
            x: 'right',
            y: 'top',
            padding: 5,
            itemGap: 10,
            show : true,
            feature : {
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : false,
        xAxis : [
            {
                type : 'category',
                data :  depttoplateworkers,
                name : '月份',
                axisLabel: {
                    show: true,
                    interval: 0,
                    rotate: 0,
                    formatter: '{value}月'
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                name : '清点次数',
                max : maxy,
                min : 0,
                axisLabel: {
                    show: true,
                    interval: 0,
                    rotate: 0,
                    formatter: '{value}次'
                }
            }
        ],
        series : [
            {
                name:'未完成数量',
                type:'bar',
                data: depttoplatetimes,
                type:'bar',itemStyle:{normal:{label:{show:true,position:'top'}}},
            },
            {
                name:'已完成数量',
                type:'bar',
                data: depttoplatetimes1,
                type:'bar',itemStyle:{normal:{label:{show:true,position:'top'}}}
            }
        ]
    };
    var myChart = echarts.init(document.getElementById('depttoptenlate'));
    myChart.setOption(option);
    function eConsole(param){
        var dataIndex = param.dataIndex;
        var seriesIndex = param.seriesIndex;
        var status;
        if(seriesIndex ==0 )status=1;
        if(seriesIndex ==1 )status=2;
        eidt("统计详情",dataIndex,status);
        function eidt(title,month,status) {
            var m= month+1;
            var s= status;
            productUpdate(title,m,s);
        }
        function productUpdate(title,month,status) {
            var paramEntity={};
            createJson(paramEntity,"status",status);
            createJson(paramEntity,"searchUser",null);
            if(status == 1)createJson(paramEntity,"creatTime",month);
            else if(status == 2)createJson(paramEntity,"retTime",month);
            var pageIndex =1; //当前页码
            $.ajax({
                type: "post",
                dataType: "json",
                url: "/Invent/selectjys.action",
                contenType:"application/json;charse=utf-8",
                //traditional: true,
                data: {
                    "page": JSON.stringify(
                        {
                            "paramEntity": paramEntity
                        }
                    )
                },
                success: function (result) {
                    var re = result;
                    applicationList = re.list;
                    var applicationHtml = "";

                    for (var a = 0; a < applicationList.length; a++) {
                        var page =  a + 1;
                        var id = applicationList[a].capuseid;
                        var statusShow = null;
                        if(applicationList[a].status==0)
                            statusShow = "编辑中";
                        else if(applicationList[a].status==1)
                            statusShow = "未完成";
                        else if(applicationList[a].status==2)
                            statusShow = "已完成";
                        else if(applicationList[a].status==null)
                            statusShow = "";
                        applicationHtml +=
                            "<tr> " +
                            "<td>" + page + "</td> " +
                            "<td>" + convertNull(applicationList[a].departmentName) + "</td> " +
                            "<td>" + convertNull(applicationList[a].applicationName) + "</td> " +
                            "<td>" + convertNull(applicationList[a].dictionaryValue) + "</td> " +
                            "<td>" + convertNull(applicationList[a].sysuserName) + "</td> " +
                            "<td style='text-align: center'>"+ convertNull(applicationList[a].creattime) + "</td> " +
                            "<td style='text-align: center'>" + convertNull(applicationList[a].rettime) + "</td> " +
                            "<td>" + convertNull(applicationList[a].performerName) + "</td> " +
                            "<td style='text-align: center'>" + statusShow + "</td> " +
                            "<td style='text-align: center'>" + convertNull(applicationList[a].result) + "</td> " +
                            "<td style='text-align: center;color: #2283C5;'> " +
                            "<span>" +
                            "<a style='cursor:pointer;text-decoration:none' class='productDetail' value='" + applicationList[a].id + "''> 查看详情 </a> " +
                            "</span>" +
                            "</td> " +
                            "</tr>"
                    }
                    $("#mijianTable-month").empty();

                    $("#mijianTable-month").append(applicationHtml);

                    var options = {
                        bootstrapMajorVersion: 3,
                        currentPage: re.pageIndex,    //变量名必须为currentPage
                        totalPages: re.totalPages,    //变量名必须为totalPages
                        itemTexts: function (type, page, current) {
                            switch (type) {
                                case "first":
                                    return "首页";
                                case "prev":
                                    return "上一页";
                                case "next":
                                    return "下一页";
                                case "last":
                                    return "末页";
                                case "page":
                                    return page;
                            }
                        },
                        onPageClicked: function (event, originalEvent, type, page) {
                            $.ajax({
                                type: "post",
                                dataType: "json",
                                url: "/userecord/select.action",
                                contenType:"application/json;charse=utf-8",
                                //traditional: true,
                                data: {
                                    "page": JSON.stringify(
                                        {
                                            "paramEntity": paramEntity
                                        }
                                    )
                                },
                                success: function (result) {
                                    var re = result;
                                    applicationList = re.list;
                                    var applicationHtml = "";

                                    for (var a = 0; a < applicationList.length; a++) {
                                        var page = (re.pageIndex - 1) * 10 + a + 1;
                                        applicationHtml +=
                                            "<tr> " +
                                            "<td>" + page + "</td> " +
                                            "<td style='text-align: center'>" + applicationList[a].proCode + "</td> " +
                                            "<td style='text-align: center'>" + applicationList[a].serNum + "</td> " +
                                            "<td>" + applicationList[a].dictionaryType + "</td> " +
                                            "<td>" + applicationList[a].model + "</td> " +
                                            "<td style='text-align: center'>" + applicationList[a].rfidCode + "</td> " +
                                            "<td>" + applicationList[a].application + "</td> " +
                                            "<td>" + applicationList[a].departmentName+ "</td> " +
                                            "<td>" + applicationList[a].locInfo + "</td> " +
                                            "</tr>"
                                    }
                                    $("#mijianTable").empty();

                                    $("#mijianTable").append(applicationHtml);
                                }
                            });
                        }
                    };
                    $('#data-pagination').bootstrapPaginator(options);
                },
                error: function (result) {

                }
            });


            newlayer(title,'#addForm-month');
            //给表单赋值
            //layer.open({
            //    type: 1,
            //    title:title,
            //    shadeClose: false,
            //    //shade: 0.8,
            //    area: ['100%', '100%'],
            //    content: $('#addForm-month'),
            //    btnAlign: 'c', //按钮居中
            //    yes: function () {
            //
            //    },
            //    btn2: function (index) {
            //        layer.closeAll();
            //    },success:function (layero,index) {
            //
            //    },cancel:function(index){
            //        layer.closeAll();
            //    }
            //});
        }
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //查看
        $(document).on("click", ".productDetail", function (){
            var id= this.getAttribute("value");
            eidt1("清点详情",dataIndex,status,id);
        })

        function eidt1(title,month,status,id) {
            var m= month+1;
            var s= status;
            productUpdate1(title,m,s,id);
        }
        function productUpdate1(title,month,status,id) {
            var paramEntity={};
            createJson(paramEntity,"status",status);
            createJson(paramEntity,"searchUser",'yes');
            createJson(paramEntity,"id",id);
            if(status == 1)createJson(paramEntity,"creatTime",month);
            else if(status == 2)createJson(paramEntity,"retTime",month);
            var pageIndex =1; //当前页码
            $.ajax({
                type: "post",
                dataType: "json",
                url: "/Invent/selectjys.action",
                contenType:"application/json;charse=utf-8",
                //traditional: true,
                data: {
                    "page": JSON.stringify(
                        {
                            "paramEntity": paramEntity
                        }
                    )
                },
                success: function (result) {
                    var re = result;
                    var applicationList1 = re.list;
                    var applicationHtml = "";

                    for (var a = 0; a < applicationList1.length; a++) {
                        var page =  a + 1;
                        applicationHtml +=
                            "<tr> " +
                            "<td>" + page + "</td> " +
                            "<td style='text-align: center'>" + convertNull(applicationList1[a].proCode) + "</td> " +
                            "<td style='text-align: center'>" + convertNull(applicationList1[a].serNum) + "</td> " +
                            "<td>" + convertNull(applicationList1[a].dictionaryValue) + "</td> " +
                            "<td>" + convertNull(applicationList1[a].model) + "</td> " +
                            "<td style='text-align: center'>" + convertNull(applicationList1[a].rfidCode) + "</td> " +
                            "<td>" + convertNull(applicationList1[a].applicationName) + "</td> " +
                            "<td>" + convertNull(applicationList1[a].departmentName)+ "</td> " +
                            "<td>" + convertNull(applicationList1[a].locInfo) + "</td> " +
                            "</tr>"
                    }
                    $("#mijianTable-detail").empty();

                    $("#mijianTable-detail").append(applicationHtml);

                    var options = {
                        bootstrapMajorVersion: 3,
                        currentPage: re.pageIndex,    //变量名必须为currentPage
                        totalPages: re.totalPages,    //变量名必须为totalPages
                        itemTexts: function (type, page, current) {
                            switch (type) {
                                case "first":
                                    return "首页";
                                case "prev":
                                    return "上一页";
                                case "next":
                                    return "下一页";
                                case "last":
                                    return "末页";
                                case "page":
                                    return page;
                            }
                        },
                        onPageClicked: function (event, originalEvent, type, page) {
                            $.ajax({
                                type: "post",
                                dataType: "json",
                                url: "/userecord/select.action",
                                contenType:"application/json;charse=utf-8",
                                //traditional: true,
                                data: {
                                    "page": JSON.stringify(
                                        {
                                            "paramEntity": paramEntity
                                        }
                                    )
                                },
                                success: function (result) {
                                    var re = result;
                                    applicationList = re.list;
                                    var applicationHtml = "";

                                    for (var a = 0; a < applicationList.length; a++) {
                                        var page = (re.pageIndex - 1) * 10 + a + 1;
                                        applicationHtml +=
                                            "<tr> " +
                                            "<td>" + page + "</td> " +
                                            "<td style='text-align: center'>" + applicationList[a].proCode + "</td> " +
                                            "<td style='text-align: center'>" + applicationList[a].serNum + "</td> " +
                                            "<td>" + applicationList[a].dictionaryType + "</td> " +
                                            "<td>" + applicationList[a].model + "</td> " +
                                            "<td style='text-align: center'>" + applicationList[a].rfidCode + "</td> " +
                                            "<td>" + applicationList[a].application + "</td> " +
                                            "<td>" + applicationList[a].deptname + "</td> " +
                                            "<td style='text-align: center'>" + applicationList[a].outin + "</td> " +
                                            "</tr>"
                                    }
                                    $("#mijianTable").empty();

                                    $("#mijianTable").append(applicationHtml);
                                }
                            });
                        }
                    };
                    $('#data-pagination').bootstrapPaginator(options);
                },
                error: function (result) {

                }
            });



            //给表单赋值
            newlayer(title,'#addForm-detail');
            //layer.open({
            //    type: 1,
            //    title:title,
            //    shadeClose: false,
            //    //shade: 0.8,
            //    area: ['100%', '100%'],
            //    content: $('#addForm-detail'),
            //    btnAlign: 'c', //按钮居中
            //    yes: function () {
            //
            //    },
            //    btn2: function (index) {
            //        layer.closeAll();
            //    },success:function (layero,index) {
            //
            //    },cancel:function(index){
            //        layer.closeAll();
            //    }
            //});
        }



    }
    myChart.on('click',eConsole);
}
//清退
function getDeptDayTopTenLateWorker() {
    var applicationList;
    var paramEntity = {};
    var maxy = 0;
    var maxy1 = 0;
    var depttoplateworkers = new Array();
    var depttoplatetimes = new Array();
    var depttoplateworkers1 = new Array();
    var depttoplatetimes1 = new Array();

    operationFunc(paramEntity, "/Returnobj/selectuncomnum.action", function (result) {
        var re = result;
        applicationList = re.list;
        var i=0;
        if(applicationList!=null){
            for (var a = 0; a < applicationList.length; a++){
                var depttoplateworker = applicationList[a].month;
                var depttoplatetime = applicationList[a].noncompleteNum;
                depttoplateworkers[applicationList[a].month-1] = depttoplateworker;
                depttoplatetimes[applicationList[a].month-1] = depttoplatetime;

            }
        }

        for (var a = 0; a < myMonth; a++) {
            if(depttoplateworkers[a]==null){
                var depttoplateworker = a+1;
                var depttoplatetime = 0;
                depttoplateworkers[a] = depttoplateworker;
                depttoplatetimes[a] = depttoplatetime;
            }
        }
        maxy = Math.max.apply(null,depttoplatetimes);
        if(maxy<=5)maxy=5;
        if(maxy1>maxy)maxy = maxy1;
    });
    operationFunc(paramEntity, "/Returnobj/selectcomnum.action", function (result) {
        var re = result;
        applicationList = re.list;
        var i=0;
        for (var a = 0; a < applicationList.length; a++){
            var depttoplateworker = applicationList[a].month;
            var depttoplatetime = applicationList[a].completeNum;
            depttoplateworkers1[applicationList[a].month-1] = depttoplateworker;
            depttoplatetimes1[applicationList[a].month-1] = depttoplatetime;

        }
        for (var a = 0; a < myMonth; a++) {
            if(depttoplateworkers1[a]==null){
                var depttoplateworker = a+1;
                var depttoplatetime = 0;
                depttoplateworkers1[a] = depttoplateworker;
                depttoplatetimes1[a] = depttoplatetime;
            }
        }
        maxy1 = Math.max.apply(null,depttoplatetimes1);
        if(maxy1<=5)maxy1=5;
        if(maxy1>maxy)maxy = maxy1;

    });

    option = {
        title : {
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['未完成数量','已完成数量']
        },
        toolbox: {
            orient: 'vertical',
            x: 'right',
            y: 'top',
            padding: 5,
            itemGap: 10,
            show : true,
            feature : {
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : false,
        xAxis : [
            {
                type : 'category',
                name : '月份',
                data :  depttoplateworkers,
                axisLabel: {
                    show: true,
                    interval: 0,
                    rotate: 0,
                    formatter: '{value}月'
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                name : '清退次数',
                max : maxy,
                min : 0,
                axisLabel: {
                    show: true,
                    interval: 0,
                    rotate: 0,
                    formatter: '{value}次'
                }
            }
        ],
        series : [
            {
                name:'未完成数量',
                type:'bar',
                data: depttoplatetimes,
                type:'bar',itemStyle:{normal:{label:{show:true,position:'top'}}},
            },
            {
                name:'已完成数量',
                type:'bar',
                data: depttoplatetimes1,
                type:'bar',itemStyle:{normal:{label:{show:true,position:'top'}}}
            }
        ]
    };
    var myChart = echarts.init(document.getElementById('depttoptenlate'));
    myChart.setOption(option);

    function eConsole(param){
        var dataIndex = param.dataIndex;
        var seriesIndex = param.seriesIndex;
        var status;
        if(seriesIndex ==0 )status=1;
        if(seriesIndex ==1 )status=2;
        eidt("统计详情",dataIndex,status);
        function eidt(title,month,status) {
            var m= month+1;
            var s= status;
            productUpdate(title,m,s);
        }
        function productUpdate(title,month,status) {
            var paramEntity={};
            createJson(paramEntity,"status",status);
            createJson(paramEntity,"searchUser",null);
            if(status == 1)createJson(paramEntity,"creatTime",month);
            else if(status == 2)createJson(paramEntity,"retTime",month);
            var pageIndex =1; //当前页码
            $.ajax({
                async : false,
                type: "post",
                dataType: "json",
                url: "/Returnobj/selectjys.action",
                //traditional: true,
                data: {
                    "page": JSON.stringify(
                        {
                            "paramEntity": paramEntity
                        }
                    )
                },
                success: function (result) {
                    var re = result;
                    var statusShow=null;
                    applicationList = re.list;
                    var applicationHtml = "";
                    for (var a = 0; a < applicationList.length; a++) {
                        var page =  a + 1;
                        if(applicationList[a].status==0)
                            statusShow = "编辑中";
                        else if(applicationList[a].status==1)
                            statusShow = "未完成";
                        else if(applicationList[a].status==2)
                            statusShow = "已完成";
                        else if(applicationList[a].status==null)
                            statusShow = "";
                        applicationHtml +=
                            "<tr> " +
                            "<td>" + page + "</td> " +
                            "<td>" + convertNull(applicationList[a].departmentName) + "</td> " +
                            "<td>" + convertNull(applicationList[a].applicationName) + "</td> " +
                            "<td>" + convertNull(applicationList[a].dictionaryValue) + "</td> " +
                            "<td>" + convertNull(applicationList[a].createTime) + "</td> " +
                            "<td>" + convertNull(applicationList[a].retTime) + "</td> " +
                            "<td>" + statusShow + "</td> " +
                            "<td>" + convertNull(applicationList[a].info) + "</td> " +
                            "<td style='text-align: center;color: #2283C5;'> " +
                            "<span>" +
                            "<a style='cursor:pointer;text-decoration:none' class='monthDetail' value='" + applicationList[a].id + "''> 查看详情 </a> " +
                            "</span>" +
                            "</td> " +
                            "</tr>"
                    }
                    $("#mijianTable-month-t").empty();

                    $("#mijianTable-month-t").append(applicationHtml);

                    var options = {
                        bootstrapMajorVersion: 3,
                        currentPage: re.pageIndex,    //变量名必须为currentPage
                        totalPages: re.totalPages,    //变量名必须为totalPages
                        itemTexts: function (type, page, current) {
                            switch (type) {
                                case "first":
                                    return "首页";
                                case "prev":
                                    return "上一页";
                                case "next":
                                    return "下一页";
                                case "last":
                                    return "末页";
                                case "page":
                                    return page;
                            }
                        },
                        onPageClicked: function (event, originalEvent, type, page) {
                            $.ajax({
                                type: "post",
                                dataType: "json",
                                url: "/userecord/select.action",
                                contenType:"application/json;charse=utf-8",
                                //traditional: true,
                                data: {
                                    "page": JSON.stringify(
                                        {
                                            "paramEntity": paramEntity
                                        }
                                    )
                                },
                                success: function (result) {
                                    var re = result;
                                    applicationList = re.list;
                                    var applicationHtml = "";

                                    for (var a = 0; a < applicationList.length; a++) {
                                        var page = (re.pageIndex - 1) * 10 + a + 1;
                                        applicationHtml +=
                                            "<tr> " +
                                            "<td>" + page + "</td> " +
                                            "<td>" + applicationList[a].proCode + "</td> " +
                                            "<td>" + applicationList[a].serNum + "</td> " +
                                            "<td>" + applicationList[a].dictionaryType + "</td> " +
                                            "<td>" + applicationList[a].model + "</td> " +
                                            "<td>" + applicationList[a].rfidCode + "</td> " +
                                            "<td>" + applicationList[a].application + "</td> " +
                                            "<td>" + applicationList[a].deptname + "</td> " +
                                            "<td>" + applicationList[a].outin + "</td> " +
                                            "</tr>"
                                    }
                                    $("#mijianTable").empty();

                                    $("#mijianTable").append(applicationHtml);
                                }
                            });
                        }
                    };
                    $('#data-pagination').bootstrapPaginator(options);
                },
                error: function (result) {

                }
            });


            newlayer(title,'#addForm-month-t');
            //给表单赋值
            //layer.open({
            //    type: 1,
            //    title:title,
            //    shadeClose: false,
            //    //shade: 0.8,
            //    area: ['100%', '100%'],
            //    content: $('#addForm-month'),
            //    btnAlign: 'c', //按钮居中
            //    yes: function () {
            //
            //    },
            //    btn2: function (index) {
            //        layer.closeAll();
            //    },success:function (layero,index) {
            //
            //    },cancel:function(index){
            //        layer.closeAll();
            //    }
            //});
        }
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //查看
        $(document).on("click", ".monthDetail", function (){
            var id= this.getAttribute("value");
            eidt1("清退详情",dataIndex,status,id);
        })

        function eidt1(title,month,status,id) {
            var m= month+1;
            var s= status;
            productUpdate1(title,m,s,id);
        }
        function productUpdate1(title,month,status,id) {
            var paramEntity={};
            createJson(paramEntity,"status",status);
            createJson(paramEntity,"searchUser",'yes');
            createJson(paramEntity,"id",id);
            if(status == 1)createJson(paramEntity,"creatTime",month);
            else if(status == 2)createJson(paramEntity,"retTime",month);
            var pageIndex =1; //当前页码
            $.ajax({
                type: "post",
                dataType: "json",
                url: "/Returnobj/selectjys.action",
                contenType:"application/json;charse=utf-8",
                //traditional: true,
                data: {
                    "page": JSON.stringify(
                        {
                            "paramEntity": paramEntity
                        }
                    )
                },
                success: function (result) {
                    var re = result;
                    var applicationList1 = re.list;
                    var applicationHtml = "";

                    for (var a = 0; a < applicationList1.length; a++) {
                        var page =  a + 1;
                        applicationHtml +=
                            "<tr> " +
                            "<td>" + page + "</td> " +
                            "<td>" + convertNull(applicationList1[a].proCode) + "</td> " +
                            "<td>" + convertNull(applicationList1[a].serNum) + "</td> " +
                            "<td>" + convertNull(applicationList1[a].dictionaryValue) + "</td> " +
                            "<td>" + convertNull(applicationList1[a].model) + "</td> " +
                            "<td>" + convertNull(applicationList1[a].rfidCode) + "</td> " +
                            "<td>" + convertNull(applicationList1[a].applicationName) + "</td> " +
                            "<td>" + convertNull(applicationList1[a].departmentName) + "</td> " +
                            "<td>" + convertNull(applicationList1[a].locInfo) + "</td> " +
                            "</tr>"
                    }
                    $("#mijianTable-detail-t").empty();

                    $("#mijianTable-detail-t").append(applicationHtml);

                    var options = {
                        bootstrapMajorVersion: 3,
                        currentPage: re.pageIndex,    //变量名必须为currentPage
                        totalPages: re.totalPages,    //变量名必须为totalPages
                        itemTexts: function (type, page, current) {
                            switch (type) {
                                case "first":
                                    return "首页";
                                case "prev":
                                    return "上一页";
                                case "next":
                                    return "下一页";
                                case "last":
                                    return "末页";
                                case "page":
                                    return page;
                            }
                        },
                        onPageClicked: function (event, originalEvent, type, page) {
                            $.ajax({
                                type: "post",
                                dataType: "json",
                                url: "/userecord/select.action",
                                contenType:"application/json;charse=utf-8",
                                //traditional: true,
                                data: {
                                    "page": JSON.stringify(
                                        {
                                            "paramEntity": paramEntity
                                        }
                                    )
                                },
                                success: function (result) {
                                    var re = result;
                                    applicationList = re.list;
                                    var applicationHtml = "";

                                    for (var a = 0; a < applicationList.length; a++) {
                                        var page = (re.pageIndex - 1) * 10 + a + 1;
                                        applicationHtml +=
                                            "<tr> " +
                                            "<td>" + page + "</td> " +
                                            "<td>" + applicationList[a].proCode + "</td> " +
                                            "<td>" + applicationList[a].serNum + "</td> " +
                                            "<td>" + applicationList[a].dictionaryType + "</td> " +
                                            "<td>" + applicationList[a].model + "</td> " +
                                            "<td>" + applicationList[a].rfidCode + "</td> " +
                                            "<td>" + applicationList[a].application + "</td> " +
                                            "<td>" + applicationList[a].deptname + "</td> " +
                                            "<td>" + applicationList[a].outin + "</td> " +
                                            "</tr>"
                                    }
                                    $("#mijianTable").empty();

                                    $("#mijianTable").append(applicationHtml);
                                }
                            });
                        }
                    };
                    $('#data-pagination').bootstrapPaginator(options);
                },
                error: function (result) {

                }
            });



            //给表单赋值
            newlayer(title,'#addForm-detail-t');
            //layer.open({
            //    type: 1,
            //    title:title,
            //    shadeClose: false,
            //    //shade: 0.8,
            //    area: ['100%', '100%'],
            //    content: $('#addForm-detail'),
            //    btnAlign: 'c', //按钮居中
            //    yes: function () {
            //
            //    },
            //    btn2: function (index) {
            //        layer.closeAll();
            //    },success:function (layero,index) {
            //
            //    },cancel:function(index){
            //        layer.closeAll();
            //    }
            //});
        }

    }
    myChart.on('click',eConsole);
}

function getOftenUse(temp) {
    var applicationList;
    var paramEntity = {};
    var depttoplateworkers = new Array();
    var depttoplatetimes = new Array();
    var sids = new Array();
    var param = temp;
    var maxy = 5;
    createJson(paramEntity,"searchTime",param);
    operationFunc(paramEntity, "/userecord/selectusenum.action", function (result) {
        var re = result;
        applicationList = re.list;
        var i=0;

        if(applicationList!=null){
            for (var a = 0; a < applicationList.length; a++) {
                var depttoplateworker = applicationList[a].useCount;
                var depttoplatetime = applicationList[a].useName;
                var sid = applicationList[a].sid;
                depttoplateworkers[a] = depttoplateworker;
                depttoplatetimes[a] = depttoplatetime;
                sids[a] = sid;
            }
        }

        maxy = Math.max.apply(null,depttoplatetimes);
        if(maxy<=5)maxy=5;
    });
    option = {
        tooltip : {
            trigger: 'axis',
            formatter:'{b}使用查看密品件数:{c}次'
        },
        legend: {
            data:['使用查看密品件数']
        },
        toolbox: {
            orient: 'vertical',
            x: 'right',
            y: 'top',
            padding: 5,
            itemGap: 10,
            show : true,
            feature : {
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        color: ['rgb(221,88,80)'],
        calculable : true,
        xAxis : [
            {
                type : 'category',
                data : depttoplatetimes,
                name : '人员姓名',
                axisLabel: {
                    interval: 0,
                    rotate: 0,
                    margin: 2,
                    //textStyle:{
                    //    fontWeight:"bolder",
                    //   color:"",
                    //}
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                name : '使用查看密品件数',
                max : maxy,
                min:  0,
                axisLabel:{
                    show:true,
                    interval:'auto',
                    formatter:'{value}件'
                }
            }
        ],
        series : [
            {
                name:'使用查看密品件数',
                type:'bar',itemStyle:{normal:{label:{show:true,position:'top',formatter:'{c}'}}},
                data:depttoplateworkers
            }
        ]
    };


    var myChart = echarts.init(document.getElementById('depttopearly'));
    myChart.setOption(option);
    function eConsole(param){
        var dataIndex = param.dataIndex;
        var capuseid = sids[dataIndex];
        eidt("密品统计详情",capuseid);
        function eidt(title,id) {
            var id=id
            productUpdate(id,title);
        }



        function productUpdate(id,title) {
            var searchUser=null;
            var paramEntity={};
            createJson(paramEntity,"userid",id);
            createJson(paramEntity,"searchTime",temp);
            createJson(paramEntity,"searchUser",'yes');
            var pageIndex =1; //当前页码
            $.ajax({
                type: "post",
                dataType: "json",
                url: "/userecord/select.action",
                contenType:"application/json;charse=utf-8",
                //traditional: true,
                data: {
                    "page": JSON.stringify(
                        {
                            "paramEntity": paramEntity
                        }
                    )
                },

                success: function (result) {
                    var re = result;
                    applicationList = re.list;
                    var applicationHtml = "";
                    for (var a = 0; a < applicationList.length; a++) {
                        var page =  a + 1;
                        var id = applicationList[a].capuseid;
                        var operType = null;
                        if(applicationList[a].outin==1)
                            operType = "取用";
                        else if(applicationList[a].outin==2)
                            operType = "放入";
                        else if(applicationList[a].outin==null)
                            operType = "";
                        applicationHtml +=
                            "<tr> " +
                            "<td>" + page + "</td> " +
                            "<td style='text-align: center'>" + convertNull(applicationList[a].proCode) + "</td> " +
                            "<td style='text-align: center'>" + convertNull(applicationList[a].serNum) + "</td> " +
                            "<td>" + convertNull(applicationList[a].dictionaryType) + "</td> " +
                            "<td>" + convertNull(applicationList[a].model) + "</td> " +
                            "<td style='text-align: center'>" + convertNull(applicationList[a].rfidCode) + "</td> " +
                            "<td>" + convertNull(applicationList[a].application) + "</td> " +
                            "<td>" + convertNull(applicationList[a].deptname) + "</td> " +
                            "<td style='text-align: center'>" + operType + "</td> " +
                            "</tr>"
                    }
                    $("#mijianTable").empty();

                    $("#mijianTable").append(applicationHtml);

                    var options = {
                        bootstrapMajorVersion: 3,
                        currentPage: re.pageIndex,    //变量名必须为currentPage
                        totalPages: re.totalPages,    //变量名必须为totalPages
                        itemTexts: function (type, page, current) {
                            switch (type) {
                                case "first":
                                    return "首页";
                                case "prev":
                                    return "上一页";
                                case "next":
                                    return "下一页";
                                case "last":
                                    return "末页";
                                case "page":
                                    return page;
                            }
                        },
                        onPageClicked: function (event, originalEvent, type, page) {
                            $.ajax({
                                type: "post",
                                dataType: "json",
                                url: "/userecord/select.action",
                                contenType:"application/json;charse=utf-8",
                                //traditional: true,
                                data: {
                                    "page": JSON.stringify(
                                        {
                                            "pageIndex": pageIndex, "pageSize": 10, "paramEntity": paramEntity
                                        }
                                    )
                                },
                                success: function (result) {
                                    var re = result;
                                    applicationList = re.list;
                                    var applicationHtml = "";

                                    for (var a = 0; a < applicationList.length; a++) {
                                        var page =  a + 1;
                                        applicationHtml +=
                                            "<tr> " +
                                            "<td>" + page + "</td> " +
                                            "<td style='text-align: center'>" + applicationList[a].proCode + "</td> " +
                                            "<td style='text-align: center'>" + applicationList[a].serNum + "</td> " +
                                            "<td>" + applicationList[a].dictionaryType + "</td> " +
                                            "<td>" + applicationList[a].model + "</td> " +
                                            "<td style='text-align: center'>" + applicationList[a].rfidCode + "</td> " +
                                            "<td>" + applicationList[a].application + "</td> " +
                                            "<td>" + applicationList[a].deptname + "</td> " +
                                            "<td style='text-align: center'>" + applicationList[a].outin + "</td> " +
                                            "</tr>"
                                    }
                                    $("#mijianTable").empty();

                                    $("#mijianTable").append(applicationHtml);
                                }
                            });
                        }
                    };
                    $('#data-pagination').bootstrapPaginator(options);
                },
                error: function (result) {

                }
            });



            //给表单赋值
            layer.open({
                type: 1,
                title:title,
                shadeClose: false,
                //shade: 0.8,
                area: ['100%', '100%'],
                content: $('#addForm'),
                offset:'0px',
                btnAlign: 'c', //按钮居中
                yes: function () {

                },
                btn2: function () {
                    layer.close();
                },success:function (layero,index) {

                }
            });
        }

    }
    myChart.on('click',eConsole);
}

function getApplicationNum(){
    var applicationList;
    var paramEntity = {};
    var jsonarray = [];
    var jsonarray1 = [];
    operationFunc(paramEntity, "/product/selectAppliactionNum.action", function (result) {
        var re = result;
        applicationList = re.list;
        var i=0;
        if(applicationList!=null){
            for (var a = 0; a < applicationList.length; a++) {
                var applicationNameNum = applicationList[a].applicationNameNum;
                var applicationName = applicationList[a].applicationName;
                var jsonTemp = null;
                jsonTemp = {"value":applicationNameNum,"name":applicationName};
                jsonarray.push(jsonTemp);
            }
        }

    });
    operationFunc(paramEntity, "/product/selectProductNumByApplication.action", function (result) {
        var re = result;
        applicationList = re.list;
        var i=0;
        if(applicationList!=null){
            for (var a = 0; a < applicationList.length; a++) {
                var applicationNameNum = applicationList[a].applicationNameNum;
                var dictionaryName= applicationList[a].dictionaryValue;
                var jsonTemp = null;
                jsonTemp = {"value":applicationNameNum,"name":dictionaryName};
                jsonarray1.push(jsonTemp);
            }
        }

    });
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        series: [
            {
                name:'所在系统',
                type:'pie',
                selectedMode: 'single',
                radius: [0, '50%'],

                label: {
                    normal: {
                        position: 'inner'
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data:jsonarray
            },
            {
                name:'密品类别',
                type:'pie',
                radius: ['60%', '70%'],

                data:jsonarray1
            }
        ],
        color:['#F8B34D','#1F9DE8','#EC6941','#229196','#F9D943']
    };
    var myChart = echarts.init(document.getElementById('applicationNum1'));
    myChart.setOption(option);

}

function  getProductNumByType(){
    var applicationList;
    var paramEntity = {};
    var jsonarray = [];
    var jsonarray1 = [];
    operationFunc(paramEntity, "/product/selectProductNumByType.action", function (result) {
        var re = result;
        applicationList = re.list;
        var i=0;
        if(applicationList!=null){
            for (var a = 0; a < applicationList.length; a++) {
                var applicationNameNum = applicationList[a].applicationNameNum;
                var dictionaryValue = applicationList[a].dictionaryValue;
                var jsonTemp = null;
                jsonTemp = {"value":applicationNameNum,"name":dictionaryValue};
                jsonarray.push(jsonTemp);
            }
        }

    });
    option = {
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        series : [
            {
                name: '密品类别',
                type: 'pie',
                radius : '70%',
                center: ['50%', '50%'],
                data:jsonarray,
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ],
        color:['#F8B34D','#1F9DE8','#EC6941','#229196','#F9D943']
    };
    var myChart = echarts.init(document.getElementById('applicationNum2'));
    myChart.setOption(option);

}


function  getProductNumByLocation(){
    var applicationList;
    var paramEntity = {};
    var jsonarray = [];
    var jsonarray1 = [];
    operationFunc(paramEntity, "/product/selectProductNumByLocation.action", function (result) {
        var re = result;
        applicationList = re.list;
        var i=0;
        for (var a = 0; a < applicationList.length; a++) {
            var applicationNameNum = applicationList[a].applicationNameNum;
            var locInfo = applicationList[a].locInfo;
            var jsonTemp = null;
            jsonTemp = {"value":applicationNameNum,"name":locInfo};
            jsonarray.push(jsonTemp);
        }
    });
    option = {
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        series : [
            {
                name: '密品位置',
                type: 'pie',
                radius : '70%',
                center: ['50%', '50%'],
                data:jsonarray,
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ],
        color:['#F8B34D','#1F9DE8','#EC6941','#229196','#F9D943']
    };
    var myChart = echarts.init(document.getElementById('applicationNum3'));
    myChart.setOption(option);

}
