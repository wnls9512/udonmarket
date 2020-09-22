package com.kh.udon.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.udon.product.model.service.ProductService;
import com.kh.udon.product.model.vo.ProductCategory;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController
{
    @Autowired
    private ProductService service;

    @RequestMapping("/productListView")
    public String productList(Model model)
    {
        /*
         *      1. 카테고리 목록
         *      2. 카테고리 목록별 갯수
         *      3. 전체 상품 갯수
         */
        
        List<ProductCategory> category = service.selectAllCategory();
        List<Integer> categoryCount = service.selectAllCategoryCount();
        
        log.debug("category = {}", category);
        log.debug("categoryCount = {}", categoryCount);
        
        model.addAttribute("category", category);
        model.addAttribute("categoryCount", categoryCount);
        
        return "product/productListView";
    }
    
    @RequestMapping("/productDetailView")
    public String productDetail()
    {
        return "product/productDetailView";
    }
}
