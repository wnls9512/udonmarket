package com.kh.udon.product.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class ProductPhotoVO implements Serializable
{
    private String uuid;
    private String uploadPath;
    private String fileName;
    private int pCode;
}
