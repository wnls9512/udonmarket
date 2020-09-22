package com.kh.udon.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

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
}
