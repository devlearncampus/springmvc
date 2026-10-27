package com.hexagon.springmvc.domain;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;

//이 클래스는 html 파라미터를 받는 DTO가 아니라, db 의 테이블과의 CRUD 에 사용될  domain 객체이다
@Getter
@Setter
public class Emp {
	private int empId;
	private String ename;
	private String email;
	private String phone;
	private LocalDateTime hiredate;
	private Department department;
	private Job job;
	private String status;
	private int annualLeaveDays;
	
}
