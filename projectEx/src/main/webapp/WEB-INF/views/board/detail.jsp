<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>detail</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		function fn_fileDown(fileNo) {
			$("#FILE_SEQ").attr("value", fileNo);
			formObj.attr("action", "down");
			formObj.submit();
		}

	});
</script>


<body>

	<table border="1">
			<tr>

			<td colspan="5">
				<button onclick='location.href= "wirte.go";'>등록</button>
			</td>
	  </tr>
		<tr>
			<th>글번호</th>
			<td>작성자(ID)</td>
			<td>작성일</td>
			<td>수정일</td>
			<td>조회수</td>
		</tr>

		<tr>
			<td>${detail.seq }</td>
			<td>${detail.memName }</td>
			<td>${detail.regDate }</td>
			<td>${detail.uptDate }</td>
			<td>${detail.viewCnt }</td>
		</tr>


		<tr>
			<td>제목</td>
			<td colspan="4">${detail.boardSubject }</td>
		</tr>

		<tr>
			<td>내용</td>
			<td colspan="4">${detail.boardContent }</td>
		</tr>




		<tr>
			<td colspan="5">
				<button onclick='location.href= "write.go";'>새글 등록</button>
				<button onclick='location.href= "update.go?seq=${detail.seq}";'>수정</button>
				<button>삭제</button>
				<button onclick='location.href= "list";'>목록으로 가기</button>
			</td>
		</tr>
 

		<tr>
			<c:forEach var="detail2" items="${detail2}">
				<td><a href="down?saveFile=${detail2.SAVE_NAME }&realFile=${detail2.REAL_NAME}"> ${detail2.REAL_NAME}
				</a></td> <br>
			</c:forEach>
		</tr>
	</table>
	<%--

 <a href="down?seq=${detail2.FILE_SEQ }"> --%>
</body>
</html>