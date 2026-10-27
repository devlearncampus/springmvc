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
	비동기 기술의 발전 순서
	1) XMLhttpRequest 직접 제어
	2) JQuery Ajax (외부 의존 라이브러리이므로 사용이 지양되고 있는 추세..)
	3) Promise ( 브라우저 자체 지원 API)
	4) fetch ( Promise가 사용하기에 너무 코드량이 많고 복잡하므로 fetch 로 숨겨놓음)
	5) async/await
	*/
	const login= async ()=>{

		try{
			/*스프링 시큐리티의 UsernamePasswordAuthenticationFilter 에서 파라미터를 받을때 폼 파라미터를 받음*/
			let formData = new URLSearchParams();
			
			formData.append("accountId", $("input[name='accountId']").val());
			formData.append("pwd", $("#input[name='pwd']").val());
			
			let response = await fetch("/login", {
				method:"POST",				
				headers:{
					contentType:"application/www-x-form-urlencoded; charset=UTF-8"
				},
				body:formData
			});
			
			let jsonData = await response.json();
			
			console.log("로그인 성공", jsonData);
			
		}catch(error){
			console.log("로그인 결과 에러 ", error);
		}
	}
	
	$(function(){
		$("#bt-login").click(()=>{
			login();			
		});
	});
</script>
</head>
<body>

	<div class="container">
		<h2>로그인</h2>
		<form id="form1">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Enter Your Id" name="accountId">
			</div>

			<div class="form-group">
				<input type="password" class="form-control" placeholder="Enter password" name="pwd">
			</div>

			<button type="button" class="btn btn-primary" id="bt-login">Submit</button>
		</form>
	</div>

</body>
</html>
