package com.kh.udon.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.udon.member.model.vo.Wish;
import com.kh.udon.product.model.service.ProductService;
import com.kh.udon.product.model.vo.CategoryVO;
import com.kh.udon.product.model.vo.CouponDTO;
import com.kh.udon.product.model.vo.ProductDTO;
import com.kh.udon.product.model.vo.ProductVO;
import com.kh.udon.product.model.vo.ReasonReportVO;
import com.kh.udon.product.model.vo.ReportVO;
import com.kh.udon.product.model.vo.SellerDTO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController
{
    @Autowired
    private ProductService service;

    // 전체 리스트
    @RequestMapping("/productListView")
    public String productList(Model model)
    {
        /*
         *      1. 카테고리 목록
         *      2. 카테고리 목록별 갯수
         *      3. 전체 상품 갯수
         *      4. 상품 리스트
         */
        
        List<CategoryVO> category = service.selectAllCategory();
        List<Integer> categoryCount = service.selectAllCategoryCount();
        int totalCount = service.selectTotalCount();
        List<ProductDTO> products = service.selectAll();
        
        model.addAttribute("category", category);
        model.addAttribute("categoryCount", categoryCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("products", products);
        model.addAttribute("selectedCategory", 0);
        
        return "product/productListView";
    }
    
    // 카테고리별 리스트
    @GetMapping("/categoryList")
    public String categoryList(@RequestParam("category") String categoryCode, Model model)
    {
        /*
         *      1. 카테고리 목록
         *      2. 카테고리 목록별 갯수
         *      3. 전체 상품 갯수
         *      4. 선택된 카테고리 상품 리스트
         */
        
        log.debug("categoryCode = {}", categoryCode);
        
        List<CategoryVO> category = service.selectAllCategory();
        List<Integer> categoryCount = service.selectAllCategoryCount();
        int totalCount = service.selectCategoryCount(categoryCode);
        List<ProductDTO> products = service.selectCategoryProducts(categoryCode);
        
        model.addAttribute("category", category);
        model.addAttribute("categoryCount", categoryCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("products", products);
        model.addAttribute("selectedCategory", categoryCode);
        
        return "product/productListView";
    }
    
    // 검색
    @GetMapping("/search")
    public String search(String keyword, int category, Model model)
    {
        /*
         *      1. 카테고리 목록
         *      2. 카테고리 목록별 갯수
         *      3. 전체 상품 갯수
         *      4. 선택된 카테고리 상품 리스트
         */
        Map<String, Object> map = new HashMap<>();
        map.put("keyword", keyword);
        map.put("category", category);
        
        List<CategoryVO> categoryList = service.selectAllCategory();
        List<Integer> categoryCount = service.selectAllCategoryCount();
        int totalCount = service.selectSearchCount(map);
        List<ProductDTO> products = service.search(map);
        
        model.addAttribute("category", categoryList);
        model.addAttribute("categoryCount", categoryCount);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("products", products);
        model.addAttribute("selectedCategory", category);
        
        return "product/productListView";
    }
    
    // 상품 등록 화면
    @GetMapping("/register")
    public void register(@RequestParam String userId, Model model) 
    {
        CouponDTO coupon = service.selectCoupon(userId);
        List<CategoryVO> category = service.selectAllCategory();
        
        model.addAttribute("category", category);
        model.addAttribute("coupon", coupon);
    }
    
    // 게시글 등록
    @PostMapping("/register")
    public String register(ProductVO product, RedirectAttributes rttr)
    {
        int result = service.insert(product);
        
        rttr.addFlashAttribute("msg", result > 0 ? "상품 등록 성공 💛" : "상품 등록 실패 🤔");
        
        return "redirect:/product/productListView";
    }
    
    // 게시글 상세보기
    @RequestMapping("/productDetailView")
    public String productDetail(int pCode, Model model)
    {
        /*
         *      1. 상품 정보
         *      2. 판매자 정보
         *      3. 비슷한 상품
         *      4. 판매자 다른 상품
         *      5. 신고 목록
         */
        ProductDTO product = service.selectDTOByPCode(pCode);
        SellerDTO seller = service.selectSeller(product.getSeller());
        List<ReasonReportVO> reasonReport = service.selectReasonReport();
        
        // --- 비슷한 상품 ---
        String[] keywords = product.getTitle().split(" ");
        int category = product.getCategoryCode();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("keywords", keywords);
        map.put("category", category);
        map.put("pCode", pCode);
        
        List<ProductVO> similar = service.selectSimilarProducts(map);
        
        // --- 판매자 다른 상품 ---
        List<ProductVO> other = service.selectOtherProducts(product.getSeller());
        
        // --- 시간 차 구하기 ---
        long timeMillis = System.currentTimeMillis() - product.getOriginalRegDate().getTime();
        product.setTimeMillis(timeMillis);
        
        model.addAttribute("product", product);
        model.addAttribute("seller", seller);
        model.addAttribute("similar", similar);
        model.addAttribute("other", other);
        model.addAttribute("reasonReport", reasonReport);
        
        return "product/productDetailView";
    }
    
    // 관심목록 추가
    @PostMapping(value = "/addToWish", produces = "application/text; charset=utf8")
    @ResponseBody
    public String addToWish(Wish wish)
    {
        int result = service.addToWish(wish);
        
        return result > 0 ? "관심목록에 추가했어요 💗" : "관심목록 추가에 실패했어요 💦";
    }
    
    // 상품 상태 변경
    @PostMapping(value = "/changeStatus", produces = "application/text; charset=utf8")
    @ResponseBody
    public String changeStatus(String status, int pCode)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", status);
        map.put("pCode", pCode);
        
        int result = service.changeStatus(map);
        
        return result > 0 ? "상태가 변경되었어요 🍜" : "상태 변경에 실패했어요 💧";
    }
    
    // 상품 수정
    @GetMapping("/updateProduct")
    public String updateProduct(@RequestParam int pCode, @RequestParam String categoryName, Model model)
    {
        ProductVO product = service.selectVOByPCode(pCode);
        CouponDTO coupon = service.selectCoupon(product.getSeller());
        List<CategoryVO> category = service.selectAllCategory();
        
        model.addAttribute("product", product);
        model.addAttribute("coupon", coupon);
        model.addAttribute("category", category);
        model.addAttribute("categoryName", categoryName);
        
        return "product/update";
    }
    @PostMapping("/update")
    public String update(ProductVO product, RedirectAttributes rttr)
    {
        log.debug("product = {}", product);
        
        int result = service.update(product);
        
        rttr.addFlashAttribute("msg", result > 0 ? "상품 수정 성공 💛" : "상품 등록 실패 🤔");
        
        return "redirect:/product/productListView";
    }
    
    // 상품 삭제
    @PutMapping("/{pCode}")
    @ResponseBody
    public Map<String, Object> deleteMenu(@PathVariable int pCode)
    {
        Map<String, Object> map = new HashMap<>();
        
        String msg = "삭제되었습니다 😄";
        
        try 
        {
            int result = service.delete(pCode);
        } 
        catch(Exception e) 
        {
            log.error("메뉴 삭제 오류", e);
            msg = "삭제에 실패했어요 💧";
        }
        
        map.put("msg", msg);
        
        return map;
    }
    
    // 끌올
    @PutMapping("/pull/{price}/{pCode}")
    @ResponseBody
    public Map<String, Object> pull(@PathVariable String price, @PathVariable int pCode)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        int result = 0;
        
        Map<String, Object> param = new HashMap<String, Object>();
        
        if(price.equals("x"))
            result = service.pull(pCode);
        else
        {
            param.put("price", Integer.parseInt(price));
            param.put("pCode", pCode);
            
            result = service.pull(param);
        }
        
        String msg = result > 0 ? "끌어올리기 성공 😄" : "끌어올리기에 실패했어요 💧";
        
        map.put("msg", msg);
        
        return map;
    }   
    
    // 신고 리스트
    @GetMapping("/report/{reasonCode}")
    @ResponseBody
    public List<ReasonReportVO> reportList(@PathVariable int reasonCode)
    {
        List<ReasonReportVO> reasonList = service.selectReportListByRCode(reasonCode);
        
        return reasonList;
    }
    
    // 상품 게시글 신고
    @PostMapping(value = "/reportProduct", produces = "application/text; charset=utf8")
    @ResponseBody
    public String reportProduct(ReportVO report)
    {
        int result = service.reportProduct(report);
        
        return result > 0 ? "신고가 접수되었습니다." : "다시 시도해주세요.";
    }
    
    // 유저 신고
    @PostMapping(value = "/reportUser", produces = "application/text; charset=utf8")
    @ResponseBody
    public String reportUser(ReportVO report)
    {
        log.debug("report = {}", report);
        
        int result = service.reportUser(report);
        
        return result > 0 ? "신고가 접수되었습니다." : "다시 시도해주세요.";
    }
    
    
}
