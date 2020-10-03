package com.kh.udon.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.udon.member.model.vo.Wish;
import com.kh.udon.product.model.service.ProductService;
import com.kh.udon.product.model.vo.CategoryVO;
import com.kh.udon.product.model.vo.CouponDTO;
import com.kh.udon.product.model.vo.ProductListDTO;
import com.kh.udon.product.model.vo.ProductVO;

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
        List<ProductListDTO> products = service.selectAll();
        
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
        List<ProductListDTO> products = service.selectCategoryProducts(categoryCode);
        
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
        List<ProductListDTO> products = service.search(map);
        
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
        ProductListDTO product = service.selectOneByPCode(pCode);
        
        model.addAttribute("product", product);
        
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
    
}
