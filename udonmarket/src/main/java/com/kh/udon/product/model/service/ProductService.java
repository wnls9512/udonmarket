package com.kh.udon.product.model.service;

import java.util.List;
import java.util.Map;

import com.kh.udon.member.model.vo.Wish;
import com.kh.udon.product.model.vo.CategoryVO;
import com.kh.udon.product.model.vo.CouponDTO;
import com.kh.udon.product.model.vo.ProductDTO;
import com.kh.udon.product.model.vo.ProductVO;

public interface ProductService
{

    List<CategoryVO> selectAllCategory();

    List<Integer> selectAllCategoryCount();

    int selectTotalCount();

    int selectCategoryCount(String categoryCode);

    CouponDTO selectCoupon(String userId);

    int insert(ProductVO product);

    List<ProductDTO> selectAll();

    List<ProductDTO> selectCategoryProducts(String categoryCode);

    int addToWish(Wish wish);

    List<ProductDTO> search(Map<String, Object> map);

    int selectSearchCount(Map<String, Object> map);



}
