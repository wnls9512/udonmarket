package com.kh.udon.community.model.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


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
public class Community implements Serializable
{
	
	private int bCode;
	private String userId;
	private int categoryCode;
	private String boardTitle;
	private String boardContent;
	private Date regDate;
	private int hashtagCode;
	private int likeThis;
	private int BoardphotoCount;
	private String nickname;
	private String address;
	private int replyCount;
	
	
	private List<Boardphoto> BoardphotoList;

}
