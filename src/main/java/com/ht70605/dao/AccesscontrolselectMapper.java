package com.ht70605.dao;
import com.ht70605.entity.AccesscontrolSelect;
import java.util.List;

/**
 * Created by 706 on 2017/7/5.
 */
public interface AccesscontrolselectMapper extends BaseMapper<AccesscontrolSelect>{
    List<AccesscontrolSelect> selectAll();
}
