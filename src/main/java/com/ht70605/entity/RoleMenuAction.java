package com.ht70605.entity;

/**
 * Created by Administrator on 2017/8/27.
 */
public class RoleMenuAction {
    private String uid;
    private String roleId;
    private String roleName;
    private String menuId;
    private String menuName;
    private String Action;//仅仅只读权限

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getAction() {
        return Action;
    }

    public void setAction(String action) {
        Action = action;
    }
}
