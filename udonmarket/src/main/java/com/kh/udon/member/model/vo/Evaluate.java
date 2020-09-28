package com.kh.udon.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Evaluate extends Evalution{

	private int evaCode;
	private String userId;
	private int count;
	
	public Evaluate(int eva_code, String content, boolean kind, String member) {
		super(eva_code, content, kind, member);
		// TODO Auto-generated constructor stub
	}

	
}
