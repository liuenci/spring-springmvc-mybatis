package com.cier.dao;

import com.cier.pojo.Dept;

import java.util.List;

public interface DeptMapper {
    int deleteByPrimaryKey(Integer deptno);

    int insert(Dept record);

    int insertSelective(Dept record);

    Dept selectByPrimaryKey(Integer deptno);

    int updateByPrimaryKeySelective(Dept record);

    int updateByPrimaryKey(Dept record);

    List<Dept> selectList();

    int queryCount();

    List<Dept> selectListByName(String dname);
}