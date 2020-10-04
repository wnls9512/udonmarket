package com.kh.udon.product.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.udon.member.model.vo.Wish;
import com.kh.udon.product.model.vo.CategoryVO;
import com.kh.udon.product.model.vo.CouponDTO;
import com.kh.udon.product.model.vo.ProductDTO;
import com.kh.udon.product.model.vo.ProductVO;
import com.kh.udon.product.model.vo.SellerDTO;

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

    @Override
    public List<ProductDTO> selectCategoryProducts(String categoryCode)
    {
        return session.selectList("product.selectCategoryProducts", categoryCode);
    }

    @Override
    public int addToWish(Wish wish)
    {
        return session.insert("product.addToWish", wish);
    }

    @Override
    public List<ProductDTO> search(Map<String, Object> map)
    {
        return session.selectList("product.search", map);
    }

    @Override
    public int selectSearchCount(Map<String, Object> map)
    {
        return session.selectOne("product.selectSearchCount", map);
    }

    @Override
    public ProductDTO selectOneByPCode(int pCode)
    {
        return session.selectOne("product.selectOneByPCode", pCode);
    }

    @Override
    public SellerDTO selectSeller(String id)
    {
        return session.selectOne("product.selectSeller", id);
    }




    
    
    
}
