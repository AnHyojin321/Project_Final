package com.kh.ski.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// 이메일 인증용 24/12/05 김동준
public class EmailCert {
	
	private String email;//	EMAIL	VARCHAR2(30 BYTE)
	private String certNo;//	CERT_NO	VARCHAR2(6 BYTE)
	private Date createTime;//	CREATE_TIME	DATE

	public EmailCert() {}

	public EmailCert(String email, String certNo, Date createTime) {
		super();
		this.email = email;
		this.certNo = certNo;
		this.createTime = createTime;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCertNo() {
		return certNo;
	}

	public void setCertNo(String certNo) {
		this.certNo = certNo;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "EmailCert [email=" + email + ", certNo=" + certNo + ", createTime=" + createTime + "]";
	}
	

}
