package com.kh.udon.product.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.udon.member.model.vo.Wish;
import com.kh.udon.product.model.dao.ProductDao;
import com.kh.udon.product.model.vo.CategoryVO;
import com.kh.udon.product.model.vo.CouponDTO;
import com.kh.udon.product.model.vo.ProductDTO;
import com.kh.udon.product.model.vo.ProductVO;
import com.kh.udon.product.model.vo.SellerDTO;

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

    @Override
    public int addToWish(Wish wish)
    {
        return dao.addToWish(wish);
    }

    @Override
    public List<ProductDTO> search(Map<String, Object> map)
    {
        return dao.search(map);
    }

    @Override
    public int selectSearchCount(Map<String, Object> map)
    {
        return dao.selectSearchCount(map);
    }

    @Override
    public ProductDTO selectDTOByPCode(int pCode)
    {
        return dao.selectOneByPCode(pCode);
    }

    @Override
    public SellerDTO selectSeller(String id)
    {
        return dao.selectSeller(id);
    }

    @Override
    public int changeStatus(Map<String, Object> map)
    {
        return dao.changeStatus(map);
    }

    @Override
    public ProductVO selectVOByPCode(int pCode)
    {
        return dao.selectVOByPCode(pCode);
    }

    @Override
    public int update(ProductVO product)
    {
        return dao.update(product);
    }

    @Override
    public int delete(int pCode)
    {
        return dao.delete(pCode);
    }

    @Override
    public int pull(int pCode)
    {
        return dao.pull(pCode);
    }

    @Override
    public int pull(Map<String, Object> param)
    {
        return dao.pull(param);
    }





    
    
    
    
}
