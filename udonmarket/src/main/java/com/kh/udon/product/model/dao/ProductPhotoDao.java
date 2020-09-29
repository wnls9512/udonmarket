package com.kh.udon.product.model.dao;

import java.util.List;

import com.kh.udon.product.model.vo.ProductPhotoVO;

public interface ProductPhotoDao
{
    public void insert(ProductPhotoVO vo);
    
    public void delete(String uuid);
    
    public List<ProductPhotoVO> finyByPcode(int pCode);
}
