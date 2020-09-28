package com.kh.udon.product.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class ProductVO implements Serializable
{
    int p_code;
    String seller;
    String buyer;
    String title;
    int category;
    String content;
    int price;
    Date regDate;
    boolean openStatus;
    String tradeStatus;
    boolean coupon;
    boolean offer;
}
