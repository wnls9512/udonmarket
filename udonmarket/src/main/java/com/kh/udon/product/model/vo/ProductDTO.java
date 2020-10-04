package com.kh.udon.product.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class ProductDTO implements Serializable
{
    // list
    int pCode;
    String seller;
    String title;
    String content;
    int price;
    int regDate; // 2 days ago
    String address;
    
    int wish;
    int chat;
    
    // detail
    String category;
    String tradeStatus;
    int offer;
}
