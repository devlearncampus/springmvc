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
	1) 순수 XMLHttpRequest 
	2) JQuery 에서 지원하는 비동기 - XMLHttpRequest 사용법을  Jquery 로 단순화 시켜놓은
	3) Promise 에서 비동기 
	4) fetch 에서 비동기 
	5) async/await
	*/
	function regist(){
		//비동기 방식으로 POST 요청을 시도하되 순수 XMLHttpRequest를 사용하면 코드량이 많아지고 복잡하므로, JQuery 를 사용하여 좀더 단순화시켜본다
		$.ajax({
			url:"/rest/emp/regist",
			type:"POST",
			//html 의 form태그로 즉 동기방식으로 post 전송을 시도하면 내부적으로 
			//contentType(전송할 데이터 유형)이 자동으로 브라우저에 의해 application/x-www-form-urlencoded; charset=UTF-8
			//우리의 경우 지금 비동기로 요청하는 바람에, 더이상 자동으로 설정되지 않는다..따라서 우리가 직접 붙여야한다..
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			data:{
				name:$("input[name='name']").val(),	
				age:$("input[name='age']").val(),	
				email:$("input[name='email']").val(),	
				height:$("input[name='height']").val(),	
				weight:$("input[name='weight']").val(),	
				bloodType:$("select[name='bloodType']").val()	
			},
			success: function(result, status, xhr){
				//서버에서 성공적인 응답 정보가 전송되면 이 익명함수 동작함
				//result 서버에서 보내온 데이터( 우리의 경우 스트링)
				//status 서버에서 보내온 HTTP  상태 코드 (성공 200, 500에러..)
				//xhr  : XMLHttpRequest
				console.log("서버에서 보내온 데이터는 ", result);
			}
		});
	}
	
	
	function getList(){
		$.ajax({
			url:"/rest/emp/list",
			type:"GET",
			success:function(result, status, xhr){
				console.log(result);
			}			
		});	
	}
	
	$(function(){
		$("#bt-regist").click(()=>{
			regist();
		});
		
		getList();
	});

</script>
</head>
<body>

	<div class="container-fluid">
		<h1>Hello World!</h1>
		<p>Resize the browser window to see the effect.</p>
		<p>The columns will automatically stack on top of each other when
			the screen is less than 768px wide.</p>
		<div class="row">
			<div class="col-sm-4" style="background-color: lavender;">
				<h2>사원 등록</h2>
				<form id="form1">
				
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
					
					<button type="button" class="btn btn-primary" id="bt-regist">Submit</button>
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
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						
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
				<form id="form1">
				
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
					
					<button type="button" class="btn btn-primary" id="bt-regist">Submit</button>
				</form>
			
			
			</div>
		</div>
	</div>

</body>
</html>
