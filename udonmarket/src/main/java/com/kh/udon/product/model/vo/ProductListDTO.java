package com.kh.udon.product.model.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class ProductListDTO implements Serializable
{
    int pCode;
    String seller;
    String title;
    String content;
    int price;
    int regDate; // 2 days ago
    String address;
    
    int wish;
    int chat;
}
