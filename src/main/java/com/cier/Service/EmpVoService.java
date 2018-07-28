package com.cier.Service;

import com.cier.common.ServerResponse;
import com.cier.dao.EmpVoMapper;
import com.cier.pojo.Emp;
import com.cier.vo.EmpVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EmpVoService {

    @Autowired
    private EmpVoMapper empVoMapper;

    private Map assertList(List<EmpVo> list,int page,int rows){
        int total = (int) list.stream().count();
        int firstIndex = (page - 1) * rows;
        int lastIndex = page * rows;
        if (lastIndex >= total) {
            lastIndex = total;
        }
        List<EmpVo> empVos = list.subList(firstIndex,lastIndex);
        Map map = new HashMap();
        map.put("total",total);
        map.put("rows",empVos);
        return map;
    }

    public Map selectListByPage(int page,int rows,String ename){
        List<EmpVo> empVos = empVoMapper.selectListByPage(ename);
        return assertList(empVos,page,rows);
    }
    public Map selectList(int page,int rows){
        List<EmpVo> empVos = empVoMapper.selectList();
        /*int total = empVoMapper.selectCount();
        int firstIndex = (page - 1)*rows;
        int lastIndex = page * rows;
        List<EmpVo> empVoList;
        if (lastIndex >= total){
            lastIndex = total;
        }
        empVoList = empVos.subList(firstIndex,lastIndex);
        Map map = new HashMap();
        map.put("total",total);
        map.put("rows",empVoList);*/
        return assertList(empVos,page,rows);
    }

    public ServerResponse remove(Integer deptno){
        int result = empVoMapper.deleteById(deptno);
        if (result == 0){
            return ServerResponse.createByErrorMessage("删除失败");
        }
        return ServerResponse.createBySuccess(result);
    }

    public int save(EmpVo emp){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(emp.getHiredate());
        emp.setHiredate(java.sql.Date.valueOf(date));
        return empVoMapper.insert(emp);
    }
    public int update(EmpVo emp){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(emp.getHiredate());
        emp.setHiredate(java.sql.Date.valueOf(date));
        return empVoMapper.updateByPrimaryKey(emp);
    }
}
