package com.ht70605.dao;

import com.ht70605.entity.Dictionary;

import java.util.List;

public interface DictionaryMapper extends BaseMapper<Dictionary> {

    List<Dictionary>selectAll();

    List<Dictionary> selectDictionary();

    List<Dictionary> selectEquitMent();
}