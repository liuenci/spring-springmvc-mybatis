package com.cier.controller.easyui;

import com.cier.Service.DeptService;
import com.cier.common.ServerResponse;
import com.cier.pojo.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("datagrid")
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping("get_dept_list")
    @ResponseBody
    public Map getList(Integer page, Integer rows){
        return deptService.getPageList(page,rows);
    }

    @RequestMapping("get_dept_list_no_page")
    @ResponseBody
    public List<Dept> getList(){
        return deptService.getList();
    }


    @RequestMapping("dept_save")
    @ResponseBody
    public int save(Integer deptno,String dname,String loc){
        Dept dept = new Dept();
        dept.setDeptno(deptno);
        dept.setDname(dname);
        dept.setLoc(loc);
        return deptService.save(dept);
    }
    @RequestMapping("dept_remove")
    @ResponseBody
    public ServerResponse remove(Integer deptno){
        return deptService.remove(deptno);
    }
    @RequestMapping("select_depts_by_name")
    @ResponseBody
    public List<Dept> selectListByName(String dname){
        return deptService.selectByDname(dname);
    }
}
