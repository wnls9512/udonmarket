package com.kh.udon.product.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class ProductPhotoDTO implements Serializable
{
    private String fileName;
    private String uploadPath;
    private String uuid;
}
