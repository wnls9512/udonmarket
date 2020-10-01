package com.kh.udon.member.model.vo;

import java.io.Serializable;

import com.kh.udon.product.model.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper = true)
public class Wish extends ProductVO implements Serializable {

	private String wishCode;
	private String userId;
	private String pCode;
	
}
