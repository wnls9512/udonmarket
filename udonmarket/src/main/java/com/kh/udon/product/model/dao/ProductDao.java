package com.kh.udon.product.model.dao;

import java.util.List;

import com.kh.udon.product.model.vo.ProductCategory;

public interface ProductDao
{

    List<ProductCategory> selectAllCategory();

    List<Integer> selectAllCategoryCount();

}
