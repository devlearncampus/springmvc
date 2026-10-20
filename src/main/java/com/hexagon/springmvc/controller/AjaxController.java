package com.hexagon.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AjaxController {
	
	@GetMapping("/ajax/registform")
	public String getForm() {
		
		return "ajax/search";
	}
	
	@PostMapping("/ajax/getword")
	public String getWordList() {
		log.debug("검색 키워드 요청 받음");
		return null;
	}
}
