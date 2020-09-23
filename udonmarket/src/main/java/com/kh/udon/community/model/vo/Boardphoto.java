package com.kh.udon.community.model.vo;

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
public class Boardphoto implements Serializable {

	private int photoCOde;
	private int bCode;
	private String originalFileName;
	private String renamedFileName;
	
}
