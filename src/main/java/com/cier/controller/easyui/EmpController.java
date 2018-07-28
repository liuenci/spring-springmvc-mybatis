package com.cier.controller.easyui;

import com.cier.Service.EmpVoService;
import com.cier.common.ServerResponse;
import com.cier.pojo.Dept;
import com.cier.vo.EmpVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("datagrid")
public class EmpController {
    @Autowired
    private EmpVoService empVoService;

    @RequestMapping("/get_emp_list")
    @ResponseBody
    public Map getList(Integer page, Integer rows) {
        return empVoService.selectList(page, rows);
    }

    @RequestMapping("/get_emp_list_by_page")
    @ResponseBody
    public Map getListByPage(Integer page, Integer rows, String ename) {
        return empVoService.selectListByPage(page, rows, ename);
    }

    @RequestMapping("remove-emp")
    @ResponseBody
    public ServerResponse remove(Integer empno) {
        return empVoService.remove(empno);
    }

    @RequestMapping("emp_save")
    @ResponseBody
    public int save(EmpVo empVo) {
        return empVoService.save(empVo);
    }

    @RequestMapping("emp_update")
    @ResponseBody
    public int update(EmpVo empVo) {
        return empVoService.update(empVo);
    }
}
