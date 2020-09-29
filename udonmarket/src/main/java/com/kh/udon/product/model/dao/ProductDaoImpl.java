package com.kh.udon.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.udon.product.model.vo.CategoryVO;
import com.kh.udon.product.model.vo.CouponDTO;
import com.kh.udon.product.model.vo.ProductDTO;
import com.kh.udon.product.model.vo.ProductVO;

@Repository
public class ProductDaoImpl implements ProductDao
{
    @Autowired
    private SqlSessionTemplate session;

    @Override
    public List<CategoryVO> selectAllCategory()
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

    @Override
    public int selectCategoryCount(String categoryCode)
    {
        return session.selectOne("product.selectCategoryCount", categoryCode);
    }

    @Override
    public CouponDTO selectCoupon(String userId)
    {
        return session.selectOne("product.selectCoupon", userId);
    }

    @Override
    public int insert(ProductVO product)
    {
        return session.insert("product.insert", product);
    }

    @Override
    public List<ProductDTO> selectAll()
    {
        return session.selectList("product.selectAll");
    }
    
    
    
}
