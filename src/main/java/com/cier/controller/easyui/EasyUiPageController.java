package com.cier.controller.easyui;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("datagrid/")
public class EasyUiPageController {
    @RequestMapping("demo1")
    public String toDataGridDemo1(){
        return "easyui/datagrid/demo1";
    }

    @RequestMapping("demo2")
    public String toDataGridDemo2(){
        return "easyui/datagrid/demo2";
    }
    @RequestMapping("dept_add_win")
    public String toDeptAddWin(){
        return "easyui/datagrid/win_dept_add";
    }

    @RequestMapping("emp_add_win")
    public String toEmpAddWin(){
        return "easyui/datagrid/win_emp_add";
    }
    @RequestMapping("demo3")
    public String toDemo3(){
        return "easyui/datagrid/demo3";
    }
    @RequestMapping("demo4")
    public String toDemo4(){
        return "easyui/datagrid/demo4";
    }
    @RequestMapping("win_emp_edit")
    public String toEmpEditWin(){
        return "easyui/datagrid/win_emp_edit";
    }
}
