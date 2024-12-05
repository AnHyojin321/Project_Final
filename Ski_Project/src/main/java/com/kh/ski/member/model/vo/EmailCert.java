package com.kh.ski.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 이메일 인증용 24/12/05 김동준
@NoArgsConstructor
@Getter
@Setter
@ToString
public class EmailCert {
	
	private String email;//	EMAIL	VARCHAR2(30 BYTE)
	private String certNo;//	CERT_NO	VARCHAR2(6 BYTE)
	private Date createTime;//	CREATE_TIME	DATE

}
