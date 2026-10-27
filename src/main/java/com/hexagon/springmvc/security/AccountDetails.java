package com.hexagon.springmvc.security;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.hexagon.springmvc.domain.Account;

import lombok.Getter;

@Getter
public class AccountDetails implements UserDetails{
	
	//사용자 정보를 낱개로 보유하지 않기 위해 Admin 통째로 보유하자!!
	private Account account;

	public AccountDetails(Account account) {
		this.account = account;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return Collections.emptyList(); //권한이 없더라도  null  로 놓으면 안되고, 그냥 객체는 존재시키되 한건도 없는 상태로 반환하면 됨..
	}

	@Override
	public String getPassword() {
		return account.getPassword();
	}

	//스프링 시큐리티에서 말하는 username  이란 로그인 아이디를 말한다!!	
	@Override
	public String getUsername() {
		return account.getLoginId();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
}
