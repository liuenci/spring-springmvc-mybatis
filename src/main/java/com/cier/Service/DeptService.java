package com.cier.Service;

import com.cier.common.ServerResponse;
import com.cier.dao.DeptMapper;
import com.cier.pojo.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DeptService {
    @Autowired
    private DeptMapper deptMapper;

    public List<Dept> getList(){
        return deptMapper.selectList();
    }

    public int save(Dept dept){
        return deptMapper.insert(dept);
    }

    public ServerResponse remove(Integer deptno){
        int result = deptMapper.deleteByPrimaryKey(deptno);
        if (result == 0){
            return ServerResponse.createByErrorMessage("删除失败");
        }
        return ServerResponse.createBySuccess(result);
    }

    public Map getPageList(Integer page, Integer rows){
        int total = deptMapper.queryCount();
        List<Dept> list = deptMapper.selectList();
        int firstIndex = (page - 1) * rows;
        int lastIndex = page * rows;
        List<Dept> subList;
        if (lastIndex >= total) {
            lastIndex = total;
        }
        subList = list.subList(firstIndex,lastIndex);
        Map map = new HashMap();
        map.put("total",total);
        map.put("rows",subList);
        return map;
    }

    public List<Dept> selectByDname(String dname){
        return deptMapper.selectListByName(dname);
    }
}
