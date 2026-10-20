<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<String> list = (List)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

//서버에서 지금 입력한 단어와 관련있는 단어들을 가져와서 사용자에게 "검색어 제안"을 시도해보자 
function getHint(){
	let form1 = document.getElementById("form1");
	form1.action="/ajax/getword";
	form1.method="POST";
	form1.submit(); //전송
}
</script>
</head>
<body>

	<form id="form1">
		<input type="text" name="keyword">
		<button type="button" onClick="getHint()">검색</button>
		<div>
		<%if(list==null){%>
			...검색어에 사용될 제안 키워드들...
		<%
		}else{
			for(String obj : list){
				out.print(obj+"<br>");				
			}	
		}
		%>
		</div>
	</form>
	
</body>
</html>