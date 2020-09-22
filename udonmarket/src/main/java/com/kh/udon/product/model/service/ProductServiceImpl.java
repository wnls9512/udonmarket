package com.kh.udon.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.product.model.dao.ProductDao;
import com.kh.udon.product.model.vo.ProductCategory;

@Service
public class ProductServiceImpl implements ProductService
{
    @Autowired
    private ProductDao dao;

    @Override
    public List<ProductCategory> selectAllCategory()
    {
        return dao.selectAllCategory();
    }

    @Override
    public List<Integer> selectAllCategoryCount()
    {
        return dao.selectAllCategoryCount();
    }

    @Override
    public int selectTotalCount()
    {
        return dao.selectTotalCount();
    }
    
    
}
