package com.ht70605.service.impl;

import com.ht70605.dao.MenuMapper;
import com.ht70605.dao.MenuMapperDao;
import com.ht70605.entity.Menu;
import com.ht70605.entity.Page;
import com.ht70605.entity.TestExcel;
import com.ht70605.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/5/10.
 */
@SuppressWarnings("SpringJavaAutowiringInspection")
@Service("MenuService")
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapperDao menuMapperDao;

    @Autowired
    private MenuMapper menuMapper;


    public void insert(Menu test) throws Exception {

    }

    public void update(Menu entity) throws Exception {

    }

    public void delete(Menu entity) throws Exception {

    }

    public void deleteList(String[] pks) throws Exception {
        menuMapperDao.deleteList(pks);
    }

    public Menu select(Menu entity) {
        return menuMapperDao.select(entity);
    }

    public Page<Menu> selectPage(Page<Menu> page) {

        List<Menu> list = menuMapperDao.selectPageList(page);
        page.setList(list);
        page.setTotalRecord(menuMapperDao.selectPageCount(page));

        return page;
    }

    //多条件分页查询
    public Page<Menu> selectPageUseDyc(Page<Menu> page) {

        List<Menu> list = menuMapperDao.selectPageListUseDyc(page);
        Integer count = menuMapperDao.selectPageCountUseDyc(page);
        page.setList(list);
        page.setTotalRecord(count);

        return page;
    }

    public List<Menu> getTree(String uId) {
        List<Menu> tree = menuMapper.getTree(uId);
        return tree;
    }

    @Override
    public List<Menu> getTreeAll() {
        List<Menu> tree = menuMapper.getTreeAll();
        return tree;
    }

}
