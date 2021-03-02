//获取角色对应的模块权限
function getuserroleaction_data(userroleaction) {
    var re_data;
    var data={
        "userroleaction":  JSON.stringify(userroleaction)
    }
    //ajax获取数据
    $.ajax({
        async:false,
        type: "post",
        dataType: "json",
        url: "/sysuser/selectRoleMenuById.action",
        data: data,
        success: function (result) {
            re_data= result;
        }
    });
    return re_data;
}
