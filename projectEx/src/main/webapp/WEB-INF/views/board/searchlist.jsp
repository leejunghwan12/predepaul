<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<table border = "1">
		
		<tr>
			<td width="50"> 체크 </td>
			<th width="100">글번호</th>
			<td width="100">작성자(ID)</td>
			<td width="300">제목</td>
			<td>작성일</td>
			<td >수정일</td>
			<td>조회수</td>
		</tr>

		<c:forEach items="${list }" var="list">

		
			<tr>
				<td>
					<div class="checkBox">
						<input type="checkbox" name="RowCheck" class="chBox"
							value="${list.seq }" />
					</div>
				</td>
				<td  width="90">${list.seq }</td>
				<td  width="50">${list.memName }(${list. memId})</td>
				<td  width="300"> <a href="detail.go?seq=${list.seq }"> ${list.boardSubject }</a></td>
				<td>${list.regDate }</td>
				<td>${list.uptDate }</td>
				<td>${list.viewCnt }</td>
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