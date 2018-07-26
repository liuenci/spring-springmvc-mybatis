package com.cier.controller;

import com.cier.Service.ProductService;
import com.cier.common.ServerResponse;
import com.cier.pojo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @RequestMapping("/get_product_list")
    @ResponseBody
    public ServerResponse<List<Product>> getList(){
        return productService.getProductList();
    }
}
