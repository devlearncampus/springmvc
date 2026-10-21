<%@page import="com.hexagon.springmvc.domain.Bio"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Paging  처리란? 많은 수의 데이터를 분할하여 화면에 보여주는 기법 
	List<Bio> empList=(List)request.getAttribute("empList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>Hover Rows</h2>
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
				<%for(int i=1;i<=pageSize; i++){ %>
				<%if(num<1)break; %>
				<%
					//List 내에서 curPos를 이용하여 Bio 도메인객체 꺼내기!!
					Bio bio=empList.get(offset++); 
				%>	
				<tr>
					<td><%=num--%></td>
					<td><%=bio.getEmp().getEname() %></td>
					<td><%=bio.getEmp().getAge() %></td>
					<td><%=bio.getEmp().getEmail() %></td>
					<td><%=bio.getHeight() %></td>
					<td><%=bio.getWeight() %></td>
					<td><%=bio.getBloodType() %></td>
				</tr>
				<%} %>
				<tr>
					<td colspan="7">
						
						<%if(firstPage-1 > 0){ %>
							<a href="/emp/list?currentPage=<%=firstPage-1%>">◀</a>
						<%}else{ %>
							<a href="javascript:alert('이전 블럭이 없습니다');">◀</a>
						<%} %>
						
						<%for(int i=firstPage;i<=lastPage;i++){ %>
							<%if(i>totalPage)break; //페이지를 출력하는 반복문의 i가 내가 가진 총 페이지수를 넘어서면 반복문 빠져나와라.. %>
							<a href="/emp/list?currentPage=<%=i%>"  <%if(i==currentPage){ %>style="font-size:25px;font-weight:bold;color:red"<%}%> >[<%=i%>]</a>
						<%} %>
						
						<%if(lastPage+1 < totalPage){ //다음 페이지가 총 페이지수보다 작다면..%>
							<a href="/emp/list?currentPage=<%=lastPage+1%>">▶</a>
						<%}else{%>
							<a href="javascript:alert('다음 블럭이 없습니다');">▶</a>
						<%} %>
					</td>	
				</tr>
				<tr>
					<td colspan="7">
						<button onClick="location.href='/emp/registform';">사원등록</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>
