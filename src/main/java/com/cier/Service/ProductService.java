package com.cier.Service;

import com.cier.common.ServerResponse;
import com.cier.dao.ProductMapper;
import com.cier.pojo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductMapper productMapper;
    public ServerResponse<List<Product>> getProductList(){
        return ServerResponse.createBySuccess(productMapper.selectList());
    }
}
