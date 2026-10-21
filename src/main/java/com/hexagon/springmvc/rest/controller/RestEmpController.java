package com.hexagon.springmvc.rest.controller;

import java.util.List;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hexagon.springmvc.domain.Bio;
import com.hexagon.springmvc.dto.request.EmpRequestDTO;
import com.hexagon.springmvc.exception.BusinessException;
import com.hexagon.springmvc.service.EmpService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//사원에 대한 요청을 처리하는 컨트롤러는 맞으나, 클라이언트의 비동기 요청을 받기 위한 컨트롤러임
//따라서 이 컨트롤러의 메서들은 jsp를 반환하면 안되고, 순수한 데이터만을 반환해서  응답 body 로 보내야 한다..
@RestController
@RequestMapping("/rest/emp")
@Slf4j
@RequiredArgsConstructor
public class RestEmpController {

	private final EmpService empService;
	
	//사원 등록 요청 받기 
	@PostMapping("/regist")
	@ResponseBody //이 어노테이션을 붙이면 DispatcherServlet  은 더이상 ViewResolver에게 jsp와의 매핑을 시도하지 않음
							//그냥 응답 정보인 response에 아래의 return 된 데이터를 탑재하고,  tomcat은 이 data를 전송해버림
							//단 html 형식으로 보내지 않음..
	public String regist(EmpRequestDTO empRequestDTO) {
		log.debug("사원명은 {}", empRequestDTO.getName());
		log.debug("나이는 {}", empRequestDTO.getAge());
		log.debug("이메일은 {}", empRequestDTO.getEmail());
		log.debug("신장은 {}", empRequestDTO.getHeight());
		log.debug("몸무게는 {}", empRequestDTO.getWeight());
		log.debug("혈액형은 {}", empRequestDTO.getBloodType());
		
		empService.regist(empRequestDTO);
		
		return "ok";
	}
	
	@GetMapping("/list")
	public List getList() {
		List<Bio> empList=empService.getEmpList();
		
		return empList;
	}
	
	//모델 영역에서 에러가 발생하면 이 컨트롤러까지 전달되기 때문에, 컨트롤러 영역에서 
	//적절한 예외를 처리하자!!
	//문법 또는 시스템 적인 에러 말고, 우리가 사업상 정해놓은 규칙으로 정의한 커스텀 예외를
	//비즈니스 예외라고 하고 , 우리의 경우 클래스명을 BusinessException 으로 정햇다..
	@ExceptionHandler(BusinessException.class)
	@ResponseBody
	public String handle(BusinessException e) {
		return e.getMessage(); //클라이언트가 비동기 요청을 시도하면 에러 조차도  jsp가 아닌
											//순수 데이터로 보여줘야 한다..
	}
	
	@ExceptionHandler(Exception.class)
	@ResponseBody
	public String handle(Exception e) {
		return e.getMessage();
	}
}

















