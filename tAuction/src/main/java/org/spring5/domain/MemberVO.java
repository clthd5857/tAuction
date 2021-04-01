package org.spring5.domain;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String memberEmail;
	private String memberAddressCode;
	private String memberAddress;
	private String memberAddressDetail;
	private String memberAddressExtra;
	private String memberPhoneNumber;
	private Date joinDate;
	private char enabled;
	//private String flag;
	
	
	private List<AuthVO> authList;
}
