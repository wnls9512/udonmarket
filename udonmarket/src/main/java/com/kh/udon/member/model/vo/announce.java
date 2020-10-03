package com.kh.udon.member.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class announce implements Serializable{
	
	private int bCode;
	private String userId;
	private int categoryCode;
	private String boardTitle;
	private String boardContent;
	private Date regDate;
	
}
