package com.ht70605.entity;

import com.ht70605.dao.BaseMapper;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Administrator on 2017/5/16.
 */
public class Page<T> {

    //当前页
    private Integer pageIndex;
    //页显示个数
    private Integer pageSize;//没给pageSize赋值就表示不需要分页
    //总记录数
    private Integer totalRecord;
    //总页数
    private Integer totalPages;
    //显示实体
    private List<T> list;
    //查询关键字
    private String keyWord;
    //条件查询
    private T paramEntity;

    //支持多条件查询

    //起始页
    private Integer start;

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(Integer totalRecord) {
        this.totalRecord = totalRecord;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public String getKeyWord() {
        return keyWord;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public Integer getStart() {
        if(pageSize==null) return 0;//没给pageSize赋值就表示不需要分页
        this.start = (pageIndex - 1) * pageSize;//（当前页-1）*每页显示的个数
        return start;
    }


    public void setStart(Integer start) {
        this.start = start;
    }

    public T getParamEntity() {
        return paramEntity;
    }

    public void setParamEntity(T paramEntity) {
        this.paramEntity = paramEntity;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageIndex=" + pageIndex +
                ", pageSize=" + pageSize +
                ", totalRecord=" + totalRecord +
                ", list=" + list +
                ", keyWord='" + keyWord + '\'' +
                ", start=" + start +
                '}';
    }


}
