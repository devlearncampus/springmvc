package com.hexagon.springmvc.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/news")
public class NewsController {
	
	/* 
	  PHP 프로그램
	  비동기 방식으로 요청을 시도할때는  요청  url 을 Restful 하게 해야 하지만, 
	  실제 파일명을 주고받는 동기방식의 요청은 그럴 필요없다  
	*/
	@GetMapping("/main")
	public String getMain(HttpServletResponse response) {
		
		response.setStatus(HttpServletResponse.SC_CONFLICT);
		
		return "news/index";
	}
	
}








