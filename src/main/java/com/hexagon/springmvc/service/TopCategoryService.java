package com.hexagon.springmvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hexagon.springmvc.domain.TopCategory;
import com.hexagon.springmvc.mapper.TopCategoryMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class TopCategoryService {
	
	private final TopCategoryMapper topCategoryMapper;
	
	//모든 카테고리 가져오기 
	public List<TopCategory> getTopCategoryList() {
		List<TopCategory> list = topCategoryMapper.selectAll();
		
		for(TopCategory top : list) {
			log.debug("top_name is {}", top.getTopName());
		}
		return list;
	}
	
}
