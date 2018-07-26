package com.cier.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
    @RequestMapping("test")
    public String index(){
        return "test";
    }
    @RequestMapping("city_list")
    public String cityList(){
        return "city-list";
    }
    @RequestMapping("/t")
    public String test(){
        return "test";
    }
}
