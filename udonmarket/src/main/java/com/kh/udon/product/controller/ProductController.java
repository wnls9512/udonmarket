package com.kh.udon.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.udon.product.model.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController
{
    @Autowired
    private ProductService service;

    @RequestMapping("/productListView")
    public String productList()
    {
        return "product/productListView";
    }
    
    @RequestMapping("/productDetailView")
    public String productDetail()
    {
        return "product/productDetailView";
    }
}
