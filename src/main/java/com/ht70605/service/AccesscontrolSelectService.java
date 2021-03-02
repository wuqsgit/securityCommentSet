package com.ht70605.service;

import com.ht70605.entity.AccesscontrolSelect;
import java.util.List;
/**
 * Created by 706 on 2017/7/5.
 */
public interface AccesscontrolSelectService  extends BaseService<AccesscontrolSelect> {
    List<AccesscontrolSelect> selectAll();
}
