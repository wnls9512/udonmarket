package com.kh.udon.product.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.udon.member.model.vo.Wish;
import com.kh.udon.product.model.vo.CategoryVO;
import com.kh.udon.product.model.vo.CouponDTO;
import com.kh.udon.product.model.vo.ProductListDTO;
import com.kh.udon.product.model.vo.ProductVO;

public interface ProductDao
{

    List<CategoryVO> selectAllCategory();

    List<Integer> selectAllCategoryCount();

    int selectTotalCount();

    int selectCategoryCount(String categoryCode);

    CouponDTO selectCoupon(String userId);
    
    int insert(ProductVO product);

    List<ProductListDTO> selectAll();

    List<ProductListDTO> selectCategoryProducts(String categoryCode);

    int addToWish(Wish wish);

    List<ProductListDTO> search(Map<String, Object> map);

    int selectSearchCount(Map<String, Object> map);

    ProductListDTO selectOneByPCode(int pCode);



}
