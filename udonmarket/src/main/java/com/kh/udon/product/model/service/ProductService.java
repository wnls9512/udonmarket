package com.kh.udon.product.model.service;

import java.util.List;

import com.kh.udon.product.model.vo.ProductCategory;

public interface ProductService
{

    List<ProductCategory> selectAllCategory();

    List<Integer> selectAllCategoryCount();

    int selectTotalCount();

}
