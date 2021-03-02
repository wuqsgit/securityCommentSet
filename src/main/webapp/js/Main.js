/**
 * Created by Administrator on 2017/6/13.
 */
var html="";
function TreeNodes (arr) {
    var _that     = this; //对象本身
    var _father   = []; //所有顶级节点
    var _children = []; //所有子节点
    var _topid=0;
    for(var i in arr) {
        if(arr[i]["pid"] == _topid) {
            _father.push(arr[i]);
        }else{
            _children.push(arr[i]);
        }
    }

    /**
     * 获取某个节点的一级子节点
     */
    this.getChildren = function(id) {
        var son = [];

        for(var i in _children) {
            if(_children[i]["pid"] == id) {
                son.push(_children[i]);
            }
        }
        return son;
    };
    CreateTreeMenu(_father,_that);
}


function CreateTreeMenu(data,_that){


     html = '';

    for(var i=0;i<data.length;i++) {

        var children = _that.getChildren(data[i]["id"]);
        var counter = children.length;

        if (i == 0) {
            html += '<li>';
            html += "<a href='#' class='onClick'>";
            html += "<i class='ace-icon fa fa-home home-icon' style='font-size: 23px;margin-right: 7px;margin-left:5px;vertical-align: top'></i>";
           // html+="<img style='width: 19px;height: 18px;margin-right: 5px;padding-bottom: 4px' src='"+data[i]["ico"]+"' />"
            html += "<span id='chushiye' class='menu-text' data-name='" + data[i]["id"] + "'  data-url='" + data[i]["url"] + "' style='font-weight: bolder' >" + data[i]["node"].trim() + "</span>";
            html += "</a>";
            html += "</li>";
        }
        else {
            if (counter == 0) {
                html += "<li>";
                html += "<a href='#' class='onClick'>";
               // html += "<i class='menu-icon fa fa-desktop'></i>";
                html+="<img style='width: 19px;height: 19px;margin-right: 8px;margin-left:5px;padding-bottom: 2px;' src='"+data[i]["ico"]+"'/>"
                html += "<span class='menu-text' data-name='" + data[i]["id"] + "' data-url='" + data[i]["url"] + "' style='font-weight: bolder' >" + data[i]["node"].trim() + " </span>";
                html += "</a>";
                html += "</li>";
            }
            else {
                html += "<li>";
                html += "<a href='#' class='dropdown-toggle'>";
                //html += "<i class='menu-icon fa fa-desktop'></i>";
                html+="<img style='width: 19px;height: 19px;margin-right: 8px;;margin-left:5px;padding-bottom: 2px' src='"+data[i]["ico"]+"'/>"
                html += "<span class='menu-text' data-name='" + data[i]["id"] + "' data-url='" + data[i]["url"] + "' style='font-weight: bolder' >" + data[i]["node"].trim() + "</span>";
                html += "<b class='arrow fa fa-angle-down'></b>";
                html += "</a>";
                html += "<ul class='submenu'>";
                for (var j = 0; j < counter; j++) {

                    html += "<li>";
                    html += "<a href='#' class='onClick' >";
                    html += "<i class='icon-double-angle-right'></i>";
                    //html+=children[j]["node"];
                    html += "<span data-name='" + children[j]["id"] + "' data-url='" + children[j]["url"] + "' style='font-weight: bolder' >" + children[j]["node"].trim() + " </span>";
                    html += "</a>";
                    html += "</li>";
                }
                html += "</ul>";
                html += "</li>";

            }
            ;
        }
    }
    }
    // html+="</ul>";
    // html+="<div class='sidebar-collapse' id='sidebar-collapse'>";
    // html+="<i class='icon-double-angle-left' data-icon1='icon-double-angle-left' data-icon2='ico