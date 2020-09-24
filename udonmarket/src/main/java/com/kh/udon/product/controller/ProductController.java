package com.kh.udon.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.udon.product.model.service.ProductService;
import com.kh.udon.product.model.vo.ProductCategory;

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
         *      
         *      
         *      
         *      4. 상품 리스트
         */
        
        List<ProductCategory> category = service.selectAllCategory();
        List<Integer> categoryCount = service.selectAllCategoryCount();
        int totalCount = service.selectTotalCount();
        
        log.debug("category = {}", category);
        log.debug("categoryCount = {}", categoryCount);
        log.debug("totalCount = {}", totalCount);
        
        model.addAttribute("category", category);
        model.addAttribute("categoryCount", categoryCount);
        model.addAttribute("totalCount", totalCount);
        
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
         *      
         *      
         *      
         *      4. 선택된 카테고리 상품 리스트
         */
        
        log.debug("categoryCode = {}", categoryCode);
        
        List<ProductCategory> category = service.selectAllCategory();
        List<Integer> categoryCount = service.selectAllCategoryCount();
        int totalCount = service.selectCategoryCount(categoryCode);
        
        log.debug("totalCount = {}", totalCount);
        
        model.addAttribute("category", category);
        model.addAttribute("categoryCount", categoryCount);
        model.addAttribute("totalCount", totalCount);
        
        return "product/productListView";
    }
    
    // 상품 등록 화면
    @GetMapping("/register")
    public void register() {}
    
    // 상품 등록
    @PostMapping("/register")
    public void register(MultipartFile[] uploadFile)
    {
        
        String uploadFolder = "C:\\upload";
        
        // make 'yyyy/MM/dd folder
        File uploadPath = new File(uploadFolder, getFolder());
        
        if(uploadPath.exists() == false)
            uploadPath.mkdirs();
        
        // save files
        for(MultipartFile multipartFile : uploadFile)
        {
            log.debug("Upload File Name = {}", multipartFile.getOriginalFilename());
            log.debug("Upload File Size = {}", multipartFile.getSize());
            
            String uploadFileName = multipartFile.getOriginalFilename();
            
            // IE has file path
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
            
            log.debug("only file name = {}", uploadFileName);
            
            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName;
            
            File saveFile = new File(uploadPath, uploadFileName);
            
            try
            {
                multipartFile.transferTo(saveFile);
            }
            catch (Exception e)
            {
                log.error(e.getMessage());
            }
        }
    }
    
    // 폴더 생성 메소드
    private String getFolder()
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        
        return str.replace("-", File.separator);
    }
    
    @RequestMapping("/productDetailView")
    public String productDetail()
    {
        return "product/productDetailView";
    }
}
