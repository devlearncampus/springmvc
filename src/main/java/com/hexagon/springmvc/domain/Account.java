package com.hexagon.springmvc.domain;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Account {
	private int accountId;
	private Emp emp;
	private String loginId;
	private String password;
	private int enabled;
	private LocalDateTime createdAt;
	private LocalDateTime lastLoginAt;
}
