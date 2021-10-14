<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setHeader("Content-Disposition", "attachment;filename=" + new  String(("downExcel").getBytes("KSC5601"), "8859_1") + ".xls");
%>
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

<body>

	
		<table id="table" border="1px">
        <tr>
			<th width="100">글번호</th>
			<td width="100">작성자(ID)</td>
			<td width="300">제목</td>
			<td>작성일</td>
			<td >수정일</td>
			<td>조회수</td>
        </tr>
        <c:forEach items="${list}" var="list">
            <tr>
               	<td  width="90">${list.seq }</td>
				<td  width="50">${list.memName }(${list. memId})</td>
				<td  width="300"> <a href="detail.go?seq=${list.seq }"> ${list.boardSubject }</a></td>
				<td>${list.regDate }</td>
				<td>${list.uptDate }</td>
				<td>${list.viewCnt }</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>