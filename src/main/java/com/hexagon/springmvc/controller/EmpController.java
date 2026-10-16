package com.hexagon.springmvc.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.hexagon.springmvc.dto.request.EmpRequestDTO;
import com.hexagon.springmvc.service.EmpService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//사원과 관련된 요청을 처리하는 하위 컨트롤러 
@Controller //  원래는  AppConfig 클래스에서 빈을 등록했지만, 스프링에서 이미 잘 알려진 특수한 빈들을 컴포넌트라 하며
//이 컴포넌트들은 어노테이션으로 자동 등록한다!! 
// @Controller, @Service, @Repository, @Component, @ControllerAdvice....
@Slf4j
public class EmpController {
	
	/*--------------------------------------------
	 사원 등록 폼 요청을 처리하는 메서드
	--------------------------------------------*/ 	
	@GetMapping("/emp/registform")
	public String getRegistForm() {
		return "emp/regist";
	}
	
	/*--------------------------------------------
	 사원 등록 요청을 처리 메서드
	--------------------------------------------*/ 	
	@PostMapping("/emp/regist")
	public String regist(@Valid @ModelAttribute EmpRequestDTO empRequestDTO) {
		//스프링은  .html 파라미터와 DTO 의 멤버변수인 필드가 일치할 경우 자동 바인딩(묶어줌)
		log.debug("사원명은 {}", empRequestDTO.getName());
		log.debug("나이는 {}", empRequestDTO.getAge());
		log.debug("이메일은 {}", empRequestDTO.getEmail());
		log.debug("신장은 {}", empRequestDTO.getHeight());
		log.debug("몸무게는 {}", empRequestDTO.getWeight());
		log.debug("혈액형은 {}", empRequestDTO.getBloodType());
		
		
		
		return null;
	}
	
	//현재 컨트롤러에서 발생하는 이벤트를 잡아내기 위한 어노테이션 선언
	//BindException 이란? HTML 폼 파라미터와 컨트롤러의 DTO 가 제대로 바인딩 되지 못하였을 경우 Spring 이 발생시키는 예외 객체
	@ExceptionHandler(BindException.class)
	public String handle(BindException e, Model model) { //이 메서드의 예외 인스턴스가 전달됨...
		
		e.printStackTrace(); //개발자를 위한 로그!!
		//여기서  jsp 출력을 담당하지 않는다..여기는 컨트롤러이 때문에...
		//View 로 가져갈 내용이 있다면 결과 저장 후 포워딩..
		//우리가 만든 프레임웍에서는 결과를 request 직접 저장했으나, 스프링MVC
		//에서는 Model 이라는 객체에 결과를 저장하면 내부적으로 자동으로  request 객체에 저장이됨..
		model.addAttribute("errorMessage", "입력 데이터가 올바르지 않습니다");
		//개발자가 redirect: 키워드를 명시하지 않으면 스프링은 디폴트가 forwarding
		
		return "error/common-error";
	}
	
}








