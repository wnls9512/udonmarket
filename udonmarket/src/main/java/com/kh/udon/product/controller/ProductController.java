package com.kh.udon.product.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.udon.product.model.service.ProductService;
import com.kh.udon.product.model.vo.ProductCategory;
import com.kh.udon.product.model.vo.ProductPhotoDTO;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

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
    public void register(Model model) 
    {
        List<ProductCategory> category = service.selectAllCategory();
        model.addAttribute("category", category);
    }
    
    // 상품 등록
    @PostMapping(value = "/register", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<ProductPhotoDTO>> register(MultipartFile[] uploadFile)
    {
        List<ProductPhotoDTO> list = new ArrayList<ProductPhotoDTO>();
        String uploadFolder = "C:\\upload";
        
        String uploadFolderPath = getFolder();
        // make 'yyyy/MM/dd folder
        File uploadPath = new File(uploadFolder, uploadFolderPath);
        
        if(uploadPath.exists() == false)
            uploadPath.mkdirs();
        
        // save files
        for(MultipartFile multipartFile : uploadFile)
        {
            ProductPhotoDTO photoDTO = new ProductPhotoDTO();
            String uploadFileName = multipartFile.getOriginalFilename();
            
            // IE has file path
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
            photoDTO.setFileName(uploadFileName);
            
            UUID uuid = UUID.randomUUID();
            uploadFileName = uuid.toString() + "_" + uploadFileName;
            
            try
            {
                File saveFile = new File(uploadPath, uploadFileName);
                multipartFile.transferTo(saveFile);
                
                photoDTO.setUuid(uuid.toString());
                photoDTO.setUploadPath(uploadFolderPath);
                
                // check image type file
                if(checkImageType(saveFile))
                {
                    FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
                    Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 200, 200);
                    thumbnail.close();
                }
                
                list.add(photoDTO);
                
            }
            catch (Exception e)
            {
                log.error(e.getMessage());
            }
        }
        
        return new ResponseEntity<List<ProductPhotoDTO>>(list, HttpStatus.OK);
    }
    
    // 폴더 생성 메소드
    private String getFolder()
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        
        return str.replace("-", File.separator);
    }
    
    // 이미지 파일 판단 메소드
    private boolean checkImageType(File file)
    {
        try
        {
            String contentType = Files.probeContentType(file.toPath());
            
            return contentType.startsWith("image");
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        
        return false;
    }
    
    // 썸네일 데이터 전송
    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName)
    {
        log.debug("fileName = {}", fileName);
        
        File file = new File("c:\\upload\\" + fileName);
        
        log.debug("file = {}", file);
        
        ResponseEntity<byte[]> result = null;

        HttpHeaders header = new HttpHeaders();
        
        try
        {
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        
        return result;
    }
    
    @RequestMapping("/productDetailView")
    public String productDetail()
    {
        return "product/productDetailView";
    }
}
