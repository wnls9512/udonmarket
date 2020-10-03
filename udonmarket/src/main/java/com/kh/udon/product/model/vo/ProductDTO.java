package com.kh.udon.product.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO implements Serializable
{
    int pCode;
    String seller;
    String title;
    int price;
    int regDate;
    String address;
    int wish;
    int chat;
}
