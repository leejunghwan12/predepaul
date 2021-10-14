<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

$("#btn").click(function(){
	
	$.ajax({
		url : "searchlist",                   // 전송 URL
	    data : $("#searchFrm").serialize(),
	    type : "get",                // GET or POST 방식	    

	    success: function(aaa){
         $("#listFrm").html(aaa);
        },
        error:function(){
        	
        	alert('실패');
        	
        }
	})
})	

</script>
</head>
<body>
	<form id = "searchFrm" name = "searchFrm">
		<input type = "hidden" name = "pageNo" id = "pageNo" value = "1">
		<input type = "hidden" name = "listSize" id = "listSize" value = "10">
		<div>
			<select name = "searchType" id = "searchType">
				<option value = "">선    택</option>
				<option value = "mem_name" >작성자</option>
				<option value = "board_subject">제   목</option>
				<option value = "board_subject||board_content">제목+내용</option>
			</select>
			<input type = "text" name = "searchTxt" id = "searchTxt">
			<input type = "button" name = "btn" id = "btn" value = "검색">
			<input type = "text" name = "stDate" id = "stDate" autocomplete="off"> ~ <input type = "text" name = "endDate" id = "endDate" autocomplete="off">
		</div>
	</form>
	<div>
		<input type = "button" name = "regBtn" id = "regBtn" value = "글쓰기" onclick = "location.href='writer'">
		<input type = "button" name = "delBtn" id = "delBtn" value = "삭제" onclick = "fncDelete()">
	</div>
	<form name = "listFrm" id = "listFrm">
		<table border = "1">
			<tr>
				<th><input type = "checkbox" name = "all" id = "all"></th>
				<th>글번호</th>
				<th>이름</th>
				<th>제목</th>
				<th>작성일</th>
				<th>등록일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${list }" var = "ddd" varStatus="num">
				<tr>
					<td><input type = "checkbox" name = "chk" id = "chk${ddd.seq }" value = "${ddd.seq }"></td>
					<td>${ddd.seq }</td>
					<td>${ddd.memName }</td>
					<td><a href = "detail?seq=${ddd.seq }">${ddd.boardSubject }</a></td>
					<td>${ddd.regDate }</td>
					<td>${ddd.uptDate }</td>
					<td>${ddd.viewCnt }</td>
				</tr>
			</c:forEach>
			<tr>
	            <td colspan="7">
	                <!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
	                <c:if test="${pageMap.curBlock > 1}">
	                    <a href="javascript:list('1')">[처음]</a>
	                </c:if>
	                
	                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
	                <c:if test="${pageMap.curBlock > 1}">
	                    <a href="javascript:list('${pageMap.prevPage}')">[이전]</a>
	                </c:if>
	                
	                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
	                <c:forEach var="num" begin="${pageMap.blockBegin}" end="${pageMap.blockEnd}">
	                    <!-- **현재페이지이면 하이퍼링크 제거 -->
	                    <c:choose>
	                        <c:when test="${num == pageMap.curPage}">
	                            <span style="color: red">${num}</span>&nbsp;
	                        </c:when>
	                        <c:otherwise>
	                            <a href="javascript:list('${num}')">${num}</a>&nbsp;
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                
	                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
	                <c:if test="${pageMap.curBlock <= pageMap.totBlock}">
	                    <a href="javascript:list('${pageMap.nextPage}')">[다음]</a>
	                </c:if>
	                
	                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
	                <c:if test="${pageMap.curPage <= pageMap.totPage}">
	                    <a href="javascript:list('${pageMap.totPage}')">[끝]</a>
	                </c:if>
	            </td>
	        </tr>
		</table>
	</form>
</body>
</html>