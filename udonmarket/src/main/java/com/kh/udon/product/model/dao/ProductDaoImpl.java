package com.kh.udon.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.udon.product.model.vo.ProductCategory;

@Repository
public class ProductDaoImpl implements ProductDao
{
    @Autowired
    private SqlSessionTemplate session;

    @Override
    public List<ProductCategory> selectAllCategory()
    {
        return session.selectList("product.selectAllCategory");
    }

    @Override
    public List<Integer> selectAllCategoryCount()
    {
        return session.selectList("product.selectAllCategoryCount");
    }

    @Override
    public int selectTotalCount()
    {
        return session.selectOne("product.selectTotalCount");
    }
    
    
    
}
