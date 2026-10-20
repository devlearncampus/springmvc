package com.hexagon.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String getWordList(String keyword, Model model) {
		
		log.debug("검색 키워드 요청 받음{}", keyword);
		
		ArrayList<String> list = null;
		
		if(keyword==null || keyword.length() <1) {
			list = new ArrayList<String>();
		}else {
			list= new ArrayList<>(List.of("사탕","사과","사람","사탄","사고"));
		}
		
		model.addAttribute("list", list);
		
		return "ajax/search";
	}
	
}









