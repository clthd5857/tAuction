package org.spring5.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.spring5.domain.MemberVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User {
	private static final long serialVersionUID=1L;
	
	private MemberVO memberVO;
	
	public CustomUser(String username,String password, Collection<? extends GrantedAuthority> authorities) {
		super(username,password, authorities);
	}
	
	public CustomUser(MemberVO memberVO)
	{
		super(memberVO.getMemberId(),memberVO.getMemberPassword(),memberVO.getAuthList().stream()
				.map(authority->new SimpleGrantedAuthority(authority.getAuthority())).collect(Collectors.toList()));
		
		this.memberVO=memberVO;
		
	}
}
