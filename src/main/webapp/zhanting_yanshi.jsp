<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/14
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title></title>

    <meta name="description" content="bootstrap grid sizing" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="../assets/css/bootstrap.css" />
    <link rel="stylesheet" href="../components/font-awesome/css/font-awesome.css" />

    <!-- page specific plugin styles -->

    <!-- text fonts -->
    <link rel="stylesheet" href="../assets/css/ace-fonts.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="../assets/css/ace-part2.css" class="ace-main-stylesheet" />
    <![endif]-->
    <link rel="stylesheet" href="../assets/css/ace-skins.css" />
    <link rel="stylesheet" href="../assets/css/ace-rtl.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="../assets/css/ace-ie.css" />
    <![endif]-->

    <!-- inline styles related to this page -->
    <style>
        /* styling the grid page's grid elements */
        .center {
            text-align: center;
        }
        .center [class*="col-"] {
            margin-top: 2px;
            margin-bottom: 2px;

            position: relative;
            text-overflow: ellipsis;
        }
        .center [class*="col-"]  div{
            position: relative;
            z-index: 2;

            padding-top: 4px;
            padding-bottom: 4px;

            display: block;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;

            width: 100%;
        }
        .center [class*="col-"]  div span{
            position: relative;
            z-index: 2;
        }
        .center [class*="col-"] div:before {
            display: block;
            content: "";

            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            z-index: 1;

            border: 1px solid #DDD;
        }

        .center [class*="col-"] div:hover:before {
            background-color: #FCE6A6;
            border-color: #EFD27A;
        }
    </style>
    <style>
        .content-wrapper{
            background-image: url("/img/5.png");
        }
        .center [class*="col-"] div:hover:before {
             background-color: transparent;
            border-color:transparent;
            border: 0px solid #DDD;
        }
    </style>

    <!-- ace settings handler -->
    <script src="../assets/js/ace-extra.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

    <!--[if lte IE 8]>
    <script src="../components/html5shiv/dist/html5shiv.min.js"></script>
    <script src="../components/respond/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body class="no-skin ">
<!-- #section:basics/navbar.layout -->
<div id="navbar" class="navbar navbar-default ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <!-- #section:basics/sidebar.mobile.toggle -->


        <!-- /section:basics/sidebar.mobile.toggle -->
        <div class="navbar-header pull-center">
            <!-- #section:basics/navbar.layout.brand -->
            <a href="#" class="navbar-brand">
                <small style="font-family: '微软雅黑'">
                  公安部密码装备监控系统
                </small>
            </a>

            <!-- /section:basics/navbar.layout.brand -->

            <!-- #section:basics/navbar.toggle -->

            <!-- /section:basics/navbar.toggle -->
        </div>

        <!-- #section:basics/navbar.dropdown -->
        <div class="navbar-buttons navbar-header pull-right" role="navigation">

        </div>

        <!-- /section:basics/navbar.dropdown -->
    </div><!-- /.navbar-container -->
</div>

<!-- /section:basics/navbar.layout -->
<div class="main-container ace-save-state" id="main-container">
    <script type="text/javascript">
        try{ace.settings.loadState('main-container')}catch(e){}
    </script>


    <!-- /section:basics/sidebar -->
    <div class="main-content">
        <div class="main-content-inner">
            <!-- #section:basics/content.breadcrumbs -->


            <!-- /section:basics/content.breadcrumbs -->
            <div class="page-content  content-wrapper">
                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                                <div  class="col-xs-8"  style="background-color: rgba(0,0,0,0.1);  border-radius: 10px 10px 10px 10px !important;">
                                    <div  id="map" style="height: 850px;width: 800px"></div>
                                </div>
                                <div class="col-xs-4">
                                    <div class="row">
                                        <div class="col-xs-12" style=" height: 100px;">
                                            <div  style="width:695px;height:70px" >
                                                <img src="img/4.png" width="670" height="89" alt="">
                                                <span style="position:absolute;top:18px;left:10%;"><font color="#fdf5e6" size="6">全国监控设备数：</font></span>
                                                <span style="position:absolute;top:30%;left:40%;"><font id="carNum" size="20"  color="#fdf5e6"></font></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row"  >
                                        <div class="col-xs-12" style="background-color: rgba(102,175,233,.1);  border-radius: 10px 10px 10px 10px !important;">
                                             <div id="pie" style="width: 400px ;height: 400px;padding: 10px"></div>
                                        </div>
                                    </div>
                                    <div class="row"  >
                                        <div class="col-xs-12" style="background-color: rgba(102,175,233,.1);  border-radius: 10px 10px 10px 10px !important;">
                                            <div id="line" style="width: 500px ;height: 300px"></div>
                                        </div>
                                    </div>
                                </div>

                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->



    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="../components/jquery/dist/jquery.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="../components/jquery.1x/dist/jquery.js"></script>
<![endif]-->
<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='../components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<script src="../components/bootstrap/dist/js/bootstrap.js"></script>

<!-- page specific plugin scripts -->

<!-- ace scripts -->
<script src="../assets/js/src/elements.scroller.js"></script>
<script src="../assets/js/src/elements.colorpicker.js"></script>
<script src="../assets/js/src/elements.fileinput.js"></script>
<script src="../assets/js/src/elements.typeahead.js"></script>
<script src="../assets/js/src/elements.wysiwyg.js"></script>
<script src="../assets/js/src/elements.spinner.js"></script>
<script src="../assets/js/src/elements.treeview.js"></script>
<script src="../assets/js/src/elements.wizard.js"></script>
<script src="../assets/js/src/elements.aside.js"></script>
<script src="../assets/js/src/ace.js"></script>
<script src="../assets/js/src/ace.basics.js"></script>
<script src="../assets/js/src/ace.scrolltop.js"></script>
<script src="../assets/js/src/ace.ajax-content.js"></script>
<script src="../assets/js/src/ace.touch-drag.js"></script>
<script src="../assets/js/src/ace.sidebar.js"></script>
<script src="../assets/js/src/ace.sidebar-scroll-1.js"></script>
<script src="../assets/js/src/ace.submenu-hover.js"></script>
<script src="../assets/js/src/ace.widget-box.js"></script>
<script src="../assets/js/src/ace.settings.js"></script>
<script src="../assets/js/src/ace.settings-rtl.js"></script>
<script src="../assets/js/src/ace.settings-skin.js"></script>
<script src="../assets/js/src/ace.widget-on-reload.js"></script>
<script src="../assets/js/src/ace.searchbox-autocomplete.js"></script>

<!-- inline scripts related to this page -->

<!-- the following scripts are used in demo only for onpage help and you don't need them -->
<link rel="stylesheet" href="../assets/css/ace.onpage-help.css" />
<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="../assets/js/src/elements.onpage-help.js"></script>
<script src="../assets/js/src/ace.onpage-help.js"></script>
<script type="text/javascript" src="js/echarts3/echarts.js"></script>
<script type="text/javascript" src="js/echarts3/map/js/china.js"></script>
<script type="application/javascript">
    jQuery(function($) {

        var height = document.documentElement.clientHeight;//获取浏览器可见区域的高度
        $(".page-content").height(height-45);

       var option = {
            tooltip: {
                trigger: 'item',
                formatter: '{b}'
            },
            series: [
                {
                    name: '中国',
                    type: 'map',
                    mapType: 'china',
                    selectedMode : 'multiple',
                    label: {
                        normal: {
                            show: true
                        },
                        emphasis: {
                            show: true
                        }
                    },
                    data:[
                        {name:'广东', selected:true}
                    ]
                }
            ]
        };

       var option2 = {
            title : {
                text: '访问来源',
                subtext: '',
                x:'center',
                textStyle:{
                    color: '#fff',
                    fontSize: 30
                }
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎'],
                textStyle:{
                    color: '#fff',
                    fontSize: 20
                }

            },
            series : [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    textStyle: {
                        color: '#fff',
                        fontSize: 30
                    },
                    data:[
                        {value:335, name:'直接访问'},
                        {value:310, name:'邮件营销'},
                        {value:234, name:'联盟广告'},
                        {value:135, name:'视频广告'},
                        {value:1548, name:'搜索引擎'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
       var myChart3 = echarts.init(document.getElementById('line'));
       var option3 = {
            title: {
                text: '动态数据',
                subtext: '',
                textStyle:{
                    color: '#fff',
                    fontSize: 30
                }
            },
           textStyle:{
               color: '#fff'
           },
           tooltip: {
                trigger: 'axis'
            },
            legend: {
                data:['最新成交价', '预购队列'],
                textStyle: {
                    color: '#fff'
                }
            },
            toolbox: {
                show: true,
                feature: {
                    dataView: {readOnly: false},
                    restore: {},
                    saveAsImage: {}
                }
            },
            dataZoom: {
                show: false,
                start: 0,
                end: 100
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: true,
                    nameTextStyle:{
                        color: '#fff',
                    },
                    axisLine:{
                        show:false
                    },
                    splitLine:{
                        show:false,
                        lineStyle: {
                            color: ['#fff']
                        }
                      },
                    axisLabel:{
                        show:true,
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    data: (function (){
                        var now = new Date();
                        var res = [];
                        var len = 10;
                        while (len--) {
                            res.unshift(now.toLocaleTimeString().replace(/^\D*/,''));
                            now = new Date(now - 2000);
                        }
                        return res;
                    })(),
                    textStyle: {
                        color: '#fff',
                        fontSize: 13,
                    }
                },
                {
                    type: 'category',
                    boundaryGap: true,
                    nameTextStyle:{
                        color: '#fff',
                    },
                    axisLine:{
                        show:true,
                        lineStyle: {
                            color:'#fff'
                        }
                    },
                    axisLabel:{
                        show:false,
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    splitLine:{
                        show:false
                    },
                    data: (function (){
                        var res = [];
                        var len = 10;
                        while (len--) {
                            res.push(len + 1);
                        }
                        return res;
                    })()
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    scale: true,
                    name: '价格',
                    max: 20,
                    min: 0,
                    boundaryGap: [0.2, 0.2],
                    nameTextStyle:{
                        color: '#fff'
                    },
                    axisLine:{
                        show:true,
                        lineStyle: {
                            color:'#fff'
                        }
                    },
                    axisLabel:{
                        show:true,
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    splitLine:{
                        show:false
                    }
                },
                {
                    type: 'value',
                    scale: true,
                    name: '',
                    nameTextStyle:{
                        color: '#fff'
                    },
                    max: 1200,
                    min: 0,
                    boundaryGap: [0.2, 0.2],
                    axisLabel:{
                        show:false,
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    axisLine:{
                        show:false
                    },
                    axisTick: {
                        show: false
                    },
                    splitLine:{
                        show:false
                    }
                }
            ],
            series: [
                {
                    name:'预购队列',
                    type:'bar',
                    xAxisIndex: 1,
                    yAxisIndex: 1,
                    data:(function (){
                        var res = [];
                        var len = 10;
                        while (len--) {
                            res.push(Math.round(Math.random() * 1000));
                        }
                        return res;
                    })()
                },
                {
                    name:'最新成交价',
                    type:'line',
                    lineStyle: {
                        normal: {
                            color: '#fff'
                        }
                    },
                    data:(function (){
                        var res = [];
                        var len = 0;
                        while (len < 10) {
                            res.push((Math.random()*10 + 5).toFixed(1) - 0);
                            len++;
                        }
                        return res;
                    })()
                }
            ]
        };
        clearInterval(this.timeTicket);
        this.count = 11;
        this.timeTicket = setInterval(function (){
            axisData = (new Date()).toLocaleTimeString().replace(/^\D*/,'');

            var data0 = option3.series[0].data;
            var data1 = option3.series[1].data;
            data0.shift();
            data0.push(Math.round(Math.random() * 1000));
            data1.shift();
            data1.push((Math.random() * 10 + 5).toFixed(1) - 0);

            option3.xAxis[0].data.shift();
            option3.xAxis[0].data.push(axisData);
            option3.xAxis[1].data.shift();
            option3.xAxis[1].data.push(this.count++);

            myChart3.setOption(option3);
        }, 2100);
        var myChart = echarts.init(document.getElementById('map'));
        myChart.setOption(option);
        var myChart2 = echarts.init(document.getElementById('pie'));
        myChart2.setOption(option2);
        myChart3.setOption(option3);


    });
</script>
</body>
</html>
