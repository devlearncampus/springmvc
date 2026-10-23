<%@page import="com.hexagon.springmvc.security.AdminDetails"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="com.hexagon.springmvc.domain.Admin"%>
<%@page import="org.springframework.security.core.context.SecurityContext"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	/*
		최상위 카테고리 목록 가져오기 !!
		비동기 통신을 위한 api 발전 순서
		1) XMLHttpRequest
		2) JQuery ajax 
		3) Promise - 웹과 상관없는 기술임..따라서 웹요청 능력X
		4) fetch  ( 비동기 웹요청 함수이고 + 호출시  Proimise)  =  Promise  + $.ajax({url, method})
		5) async/await
	*/
	function getTopList(){
		// 비동기 요청일 경우, 서버로부터 얻고자 하는 대상은 순수 데이터이므로 url 은 Restful 을 준수하자	
		fetch("/api/topcategories", {
			method:"GET"
		})
		.then( response => {//서버에 보낸 요청에 대해 서버가 응답했을때는 무조건..(500 응답에도 호출)
			//이 시점에 서버로부터 응답 헤더 및 응답 데이터 객체가 도착한다 (성공 코드가 올지 실패 코드가 올지 아직 몰라..)
			if(!response.ok){ //200 번대가 아니라면...즉 뭔가 문제가 있는 경우..
				throw new Error("목록 조회 실패");
			}
			return response.json(); //서버로부터 받아온 응답 결과물이  json형식을 갖추었다면 파싱, 형식이 올바르지 않다면.에러.
												//이 파싱 작업 자체도  비동기로 맡긴다..Promise
			
		}) // fetch 에의해 웹요청이 일어나고, 서버에서 응답이 오면 그때 then() 호출 됨
		.then( res => { //json 파싱이 성공된 시점에만 호출...파싱에 실패하면 catch 문 수행..
			console.log("목록 조회 성공", res); //js  객체 배열
		
			$("select[name='topCategory']").append("<option value='0'>▼ 상위 카테고리 선택</option>");
			
			for(let i=0;i<res.length;i++){
				$("select[name='topCategory']").append("<option value='"+res[i].topcategoryId+"'>"+res[i].topName+"</option>");
			}
			
		})
		.catch(error =>{
			console.log("에러발생", error);
		});
	}
	
	/*-----------------------------------
	상위 카테고리에 소속된 하위 카테고리 요청
	-----------------------------------*/	
	function getSubList(topcategoryId){
		fetch("/api/subcategories/"+topcategoryId ,{
			method:"GET"
		})
		//서버로 요청한 후 응답 정보가 도착하면 무조건 Promise의 then() 호출
		.then(response =>{
			if(!response.ok){
				throw new Error("목록 조회 실패");
			}
			return response.json(); //응답 정보로 받은 json문자열을 다시 js 의 객체로 복원(파싱)
		})
		// response.json() 에 의한 파싱이 성공한 경우 아래의 then() 호출됨
		.then( res =>{
			console.log(res);
			
			$("select[name='subCategory']").empty(); //기존 모든 요소 삭제!!!!
			
			for(let i=0;i<res.length;i++){
				$("select[name='subCategory']").append("<option value='"+res[i].subCategoryId+"'>"+res[i].subName+"</option>");
			}			
		})
		.catch(error =>{
			console.log("에러발생", error);
		});				
	}		
		
	$(function(){
		getTopList();	
		
		//첫번째 카테고리의 select 박스의 값을 변경하면...
		$("select[name='topCategory']").change(function(){
			console.log("값 바꿨어? ", this.value); //이벤트 익명 함수 내에서의 this 란 이벤트를 일으킨 컴포넌트인 즉 select박스를 의미..
			getSubList(this.value);
		});
	});
</script>

</head>
<body>

	<div class="container-fluid">

		<div class="row">
			<div class="col-sm-4" style="background-color: lavender;">
				<h2>뉴스 기사 등록</h2>
				<form id="regist-form">
					<div class="form-group">
						<select class="form-control" name="topCategory"></select>
					</div>
					
					<div class="form-group">
						<select class="form-control" name="subCategory"></select>
					</div>
									
					<div class="form-group">
						<input type="text" class="form-control" placeholder="기사 제목" name="name">
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="작성자" name="age">
					</div>
					
					<div class="form-group">
						<textarea class="form-control" placeholder="Write something..." name="email"></textarea>
					</div>
					
					<button type="button" class="btn btn-primary" id="bt-regist">기사 등록</button>
				</form>
			
			
			</div>
			<div class="col-sm-4" style="background-color: lavenderblush;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>No</th>
							<th>사원명</th>
							<th>나이</th>
							<th>이메일</th>
							<th>키</th>
							<th>몸무게</th>
							<th>혈액형</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<!-- 이 영역에 서버에서 가져온 데이터를 동적(= 실행시 runtime)으로 출력하겠다  -->
						
						<tr>
							<td colspan="7">
								<a href="javascript:alert('이전 블럭이 없습니다');">◀</a>
								<a href="/emp/list">▶</a>
								<a href="javascript:alert('다음 블럭이 없습니다');">▶</a>
							</td>	
						</tr>
						
					</tbody>
				</table>
			
			</div>
			<div class="col-sm-4" style="background-color: lavender;">
				<h2>사원 상세 정보</h2>
				<form id="update-form">
					
					<!-- 수정, 삭제 시 사용할 pk 값을 유저가 보지 못하게 숨겨놓기 위해..  -->
					<input type="hidden" name="empId">
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="사원명 입력" name="name">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="나이" name="age">
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="email">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="키" name="height">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="몸무게" name="weight">
					</div>
					<div class="form-group">
						<select class="form-control" name="bloodType">
							<option value="">혈액형 선택</option>
							<option value="A">A형</option>
							<option value="B">B형</option>
							<option value="O">O형</option>
							<option value="AB">AB형</option>
						</select>
					</div>
					
					<button type="button" class="btn btn-primary" id="update-bt">수정</button>
					<button type="button" class="btn btn-primary" id="delete-bt">삭제</button>
				</form>
			
			
			</div>
		</div>
	</div>

</body>
</html>
