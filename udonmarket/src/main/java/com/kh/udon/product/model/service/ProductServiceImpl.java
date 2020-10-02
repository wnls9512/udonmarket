package com.kh.udon.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.product.model.dao.ProductDao;
import com.kh.udon.product.model.vo.CategoryVO;
import com.kh.udon.product.model.vo.CouponDTO;
import com.kh.udon.product.model.vo.ProductDTO;
import com.kh.udon.product.model.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService
{
    @Autowired
    private ProductDao dao;

    @Override
    public List<CategoryVO> selectAllCategory()
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

    @Override
    public int selectCategoryCount(String categoryCode)
    {
        return dao.selectCategoryCount(categoryCode);
    }

    @Override
    public CouponDTO selectCoupon(String userId)
    {
        return dao.selectCoupon(userId);
    }

    @Override
    public int insert(ProductVO product)
    {
        return dao.insert(product);
    }

    @Override
    public List<ProductDTO> selectAll()
    {
        return dao.selectAll();
    }

    @Override
    public List<ProductDTO> selectCategoryProducts(String categoryCode)
    {
        return dao.selectCategoryProducts(categoryCode);
    }
    
    
}
