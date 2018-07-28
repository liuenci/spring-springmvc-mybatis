package com.cier.dao;

import com.cier.vo.EmpVo;

import java.util.List;

public interface EmpVoMapper {
    List<EmpVo> selectList();
    int selectCount();

    List<EmpVo> selectListByPage(String ename);

    int deleteById(Integer empno);

    int insert(EmpVo empVo);

    int updateByPrimaryKey(EmpVo empVo);
}
