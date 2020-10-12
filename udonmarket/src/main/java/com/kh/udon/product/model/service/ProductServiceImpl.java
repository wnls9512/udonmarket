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
import com.kh.udon.product.model.vo.ProductPhotoVO;
import com.kh.udon.product.model.vo.ProductVO;
import com.kh.udon.product.model.vo.ReasonReportVO;
import com.kh.udon.product.model.vo.ReportVO;
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
    public List<Integer> selectAllCategoryCount(String userId)
    {
        return dao.selectAllCategoryCount(userId);
    }

    @Override
    public int selectTotalCount(String userId)
    {
        return dao.selectTotalCount(userId);
    }

    @Override
    public int selectCategoryCount(Map<String, Object> map)
    {
        return dao.selectCategoryCount(map);
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
    public List<ProductDTO> selectAll(String userId)
    {
        return dao.selectAll(userId);
    }

    @Override
    public List<ProductDTO> selectCategoryProducts(Map<String, Object> map)
    {
        return dao.selectCategoryProducts(map);
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

    @Override
    public List<ProductVO> selectSimilarProducts(Map<String, Object> map)
    {
        return dao.selectSimilarProducts(map);
    }

    @Override
    public List<ProductVO> selectOtherProducts(String seller)
    {
        return dao.selectOtherProducts(seller);
    }

    public List<ReasonReportVO> selectReasonReport()
    {
        return dao.selectReasonReport();
    }

    @Override
    public List<ReasonReportVO> selectReportListByRCode(int reasonCode)
    {
        return dao.selectReportListByRCode(reasonCode);
    }

    @Override
    public int reportProduct(ReportVO report)
    {
        return dao.reportProduct(report);
    }

    @Override
    public int reportUser(ReportVO report)
    {
        return dao.reportUser(report);
    }

	@Override
	public List<String> selectWishUserId(int pCode) {
		return dao.selectWishUserId(pCode);
	}

    @Override
    public int insert(ProductPhotoVO photoDTO)
    {
        return dao.insert(photoDTO);
    }

    @Override
    public int updateProductCode(Map<String, Object> map)
    {
        return dao.updateProductCode(map);
    }

    @Override
    public void deleteFile(String uuid)
    {
        dao.deleteFile(uuid);
    }

    @Override
    public List<ProductPhotoVO> selectPhotos(int pCode)
    {
        return dao.selectPhotos(pCode);
    }

    @Override
    public ProductPhotoVO selectFile(ProductPhotoVO photo)
    {
        return dao.selectFile(photo);
    }






    
    
    
    
}
