package com.kh.udon.member.model.vo;

import java.io.Serializable;
import java.sql.Date;
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
public class Member implements Serializable{

	private String userId;
	private String password;
	private String email;
	private String nickName;
	private String address;
	private String originalFileName;
	private String renamedFileName;
	private Date regDate;
	private boolean enabled;
	private char quitYn;
	
	
	private List<Location> locationList;
}
