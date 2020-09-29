package com.kh.udon.product.model.dao;

import java.util.List;

import com.kh.udon.product.model.vo.CategoryVO;
import com.kh.udon.product.model.vo.CouponDTO;
import com.kh.udon.product.model.vo.ProductVO;

public interface ProductDao
{

    List<CategoryVO> selectAllCategory();

    List<Integer> selectAllCategoryCount();

    int selectTotalCount();

    int selectCategoryCount(String categoryCode);

    CouponDTO selectCoupon(String userId);
    
    int insert(ProductVO product);

}
