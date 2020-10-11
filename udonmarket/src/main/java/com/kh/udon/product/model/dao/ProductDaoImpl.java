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
import com.kh.udon.product.model.vo.ProductPhotoVO;
import com.kh.udon.product.model.vo.ProductVO;
import com.kh.udon.product.model.vo.ReasonReportVO;
import com.kh.udon.product.model.vo.ReportVO;
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
    public List<Integer> selectAllCategoryCount(String userId)
    {
        return session.selectList("product.selectAllCategoryCount", userId);
    }

    @Override
    public int selectTotalCount(String userId)
    {
        return session.selectOne("product.selectTotalCount", userId);
    }

    @Override
    public int selectCategoryCount(Map<String, Object> map)
    {
        return session.selectOne("product.selectCategoryCount", map);
    }

    @Override
    public CouponDTO selectCoupon(String userId)
    {
        return session.selectOne("product.selectCoupon", userId);
    }

    @Override
    public int insert(ProductVO product)
    {
        session.insert("product.insert", product);
        
        return product.getPCode();
    }

    @Override
    public List<ProductDTO> selectAll(String userId)
    {
        return session.selectList("product.selectAll", userId);
    }

    @Override
    public List<ProductDTO> selectCategoryProducts(Map<String, Object> map)
    {
        return session.selectList("product.selectCategoryProducts", map);
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
        return session.selectOne("product.selectDTOByPCode", pCode);
    }

    @Override
    public SellerDTO selectSeller(String id)
    {
        return session.selectOne("product.selectSeller", id);
    }

    @Override
    public int changeStatus(Map<String, Object> map)
    {
        return session.update("product.changeStatus", map);
    }

    @Override
    public ProductVO selectVOByPCode(int pCode)
    {
        return session.selectOne("product.selectVOByPCode", pCode);
    }

    @Override
    public int update(ProductVO product)
    {
        return session.update("product.update", product);
    }

    @Override
    public int delete(int pCode)
    {
        return session.update("product.delete", pCode);
    }

    @Override
    public int pull(int pCode)
    {
        return session.update("product.pull", pCode);
    }

    @Override
    public int pull(Map<String, Object> param)
    {
        return session.update("product.pullWithPrice", param);
    }

    @Override
    public List<ProductVO> selectSimilarProducts(Map<String, Object> map)
    {
        return session.selectList("product.selectSimilarProduct", map);
    }

    @Override
    public List<ProductVO> selectOtherProducts(String seller)
    {
        return session.selectList("product.selectOtherProducts", seller);
    }

    @Override
    public List<ReasonReportVO> selectReasonReport()
    {
        return session.selectList("product.reasonReport");
    }

    @Override
    public List<ReasonReportVO> selectReportListByRCode(int reasonCode)
    {
        return session.selectList("product.reportListByRCode", reasonCode);
    }

    @Override
    public int reportProduct(ReportVO report)
    {
        return session.insert("product.reportProduct", report);
    }

    @Override
    public int reportUser(ReportVO report)
    {
        return session.insert("product.reportUser", report);
    }
	
	@Override
	public List<String> selectWishUserId(int pCode) {
		return session.selectList("product.selectWishUserId",pCode);
	}

    @Override
    public int insert(ProductPhotoVO photoDTO)
    {
        return session.insert("product.insertPhoto", photoDTO);
    }

    @Override
    public int updateProductCode(Map<String, Object> map)
    {
        return session.update("product.updateProductCode", map);
    }

    @Override
    public void deleteFile(String uuid)
    {
        session.delete("product.deletePhoto", uuid);
    }

    @Override
    public List<ProductPhotoVO> selectPhotos(int pCode)
    {
        return session.selectList("product.selectPhotos", pCode);
    }






    
    
    
}
