package com.kh.udon.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.product.model.dao.ProductDao;

@Service
public class ProductServiceImpl implements ProductService
{
    @Autowired
    private ProductDao dao;
}
