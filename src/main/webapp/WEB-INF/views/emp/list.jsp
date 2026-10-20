<%@page import="com.hexagon.springmvc.domain.Bio"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Paging  처리란? 많은 수의 데이터를 분할하여 화면에 보여주는 기법 
	List<Bio> empList=(List)request.getAttribute("empList");

	int totalCount=empList.size(); 	// 총 레코드 수 
	int pageSize=10; 	// 한 페이지당 보여질 레코드 수
	int totalPage=(int)Math.ceil((float)totalCount/pageSize); 		// 총 페이지 수 
	int blockSize=10; //한 블럭당 보여질 페이지 수 
	int currentPage=1; //현재 보고 있는 페이지, 게시판을 들어오자 마자 보게되는 기본 페이지는 언제나 최신 게시물이 있는 1페이지 부터라서... 
	//currentPage 는 유저가 원하는 페이지를 선택할 경우, 그 페이지 값으로 대체가 되어야 한다..
	//즉 유저가 전송한 파라미터값으로 페이지값을 대신하자~~~
	if(request.getParameter("currentPage") !=null){ //파라미터가 있을때만 수행해야 함. 즉 게시판을 처음에 접속할때는 동작하지 말아라!! 
		currentPage = Integer.parseInt(request.getParameter("currentPage")); // 넘어온 "7" 을 --> 정수 7로 변환
	}
	int firstPage=currentPage - (currentPage-1)%blockSize; //블럭당 포문의 시작값 (힌트 - 기존의 선언된 변수들을 조합)
	int lastPage=firstPage + (blockSize-1); //블럭당 포문의 끝값  (힌트 - 기존의 선언된 변수들을 조합)
	
	
	int curPos = (currentPage-1)*pageSize; 
					// 각 페이지 당 시작 index ( 가져온 리스트내에서...)
					//힌트 : currentPage와 pageSize 만큼 비례하여 증가... , 기존 변수들을 조합해서..
					
	//현재페이지가 증가할수록  num은 totalCount 에서 pageSize 씩 비례하여 감소;  //페이지당 시작 번호 1 - 26, 2 -16,  3 - 6
	int num= totalCount - curPos;
%>
<%="totalCount="+totalCount+"<br>" %>
<%="pageSize="+pageSize+"<br>" %>
<%="totalPage="+totalPage+"<br>" %>
<%="blockSize="+blockSize+"<br>" %>
<%="currentPage="+currentPage+"<br>" %>

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
					Bio bio=empList.get(curPos++); 
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
