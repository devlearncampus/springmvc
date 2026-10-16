package com.hexagon.springmvc.service;

import org.springframework.stereotype.Service;

import com.hexagon.springmvc.domain.Emp;
import com.hexagon.springmvc.dto.request.EmpRequestDTO;
import com.hexagon.springmvc.mapper.EmpMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
/*
	사원등록 이라는 하나의 업무는 사실 ,  emp 와 bio 의 각각의 등록이라는 세부업무로 이루어져 있다.
	따라서 emp에는 등록이 성공되고 bio에는 등록이 실패될 경우 트랜잭션 처리까지 해야한다..
	
	이러한  dB분야의 전문 업무를 만일 서비스 영역이 존재하지 않는다면, Controller가 서비스 대신 처리해야 하는 상황이 발생한다..
	즉 결론) 컨트롤러는 모델 영역의 자세한 업무를 모르게 해야 한다..
	해결책) 서비스 영역을 두어야 한다.  
*/
@Service
@RequiredArgsConstructor //lombok 의 기능 중 하나로써, 현재 클래스의 멤버변수를 매개변수로 한
										//생성자를 자동으로 정의해줌..
@Slf4j
public class EmpService {
	//Mybatis 의 인터페이스를 사용할 경우 , DAO 는 필요없다 
	private final EmpMapper empMapper; 
	//final을 명시한 이유는, 멤버변수에 final 을 명시할 경우, 반드시  null이 아닌 값이 들어있어야 
	//현재 클래스가 컴파일되기 때문에, 실수로 인한 null을 방지하기 위한 설정 (안전 장치)
	/*@RequiredArgsConstructor 에 의해 아래와 같은 생성자를 자동으로 정의
	  스프링이 관리하는 빈을 주입 받기 위함 ( 즉 DI 때문에)
	    public EmpService(EmpMapper empMapper){
	    }
	*/
	public void regist(EmpRequestDTO empRequestDTO) {
		log.debug("서비스의 insert()  호출");
		
		// Mybatis  의 Mapper 인터페이스는  DTO가 아닌  도메인을 사용하기 때문에 
		// DTO 안의 데이터를 도메인 객체로 옮겨담자!!
		Emp emp = new Emp();
		emp.setEname(empRequestDTO.getName());// 사원명 옮기기 
		emp.setAge(empRequestDTO.getAge()); //나이 옮기기 
		emp.setEmail(empRequestDTO.getEmail()); //이메일 옮기기
		
		int result = empMapper.insert(emp);
		
		if(result > 0) { //성공
			log.debug("emp 등록 성공");
		}else {
			log.debug("emp 등록 실패");
		}
		
	} // emp + bio 모두  insert 하는 업무
}









