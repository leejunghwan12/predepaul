<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>list</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   
<script type="text/javascript">
		$(function(){
		 $("#searchType").val('${map.searchType}');
			$("#searchTxt").val('${map.searchTxt}');
			$("#stDate").val('${map.stDate}');
			$("#endDate").val('${map.endDate}');
			
		
			$( "#stDate, #endDate" ).datepicker({
				 dateFormat: 'yy-mm-dd',
			        prevText: '이전 달',
			        nextText: '다음 달',
			        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			        showMonthAfterYear: true,
			        yearSuffix: '년'
			
	
			
		}); 
			
			$("#btn").click(function(){
				
				$.ajax({
					url : "searchlist",                   // 전송 URL
				    data : $("#searchFrm").serialize(),
				    type : "get",                // GET or POST 방식	    
         
				    success: function(aaa){ //aaa의 기능은 무엇인지 궁금하다. 
	                 $("#listFrm").html(aaa);
	                },
	                error:function(){
	                	
	                	alert('실패');
	                	
	                }
				})
			})	
			
			
			
		})
			
		function deleteValue(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;	
			var url = "delete";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 항목이 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");				 
				$.ajax({
				    url : url,                    // 전송 URL
				    type : 'POST',                // GET or POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("삭제 성공");
	                        location.replace("list")
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});
			}
		}
		
		

			
		function list(num){
				$("#pageNo").val(num);
				$("#btn").click();
			}
		
		
</script>	
	
</head>




<body>
<form id = "searchFrm" name = "searchFrm">
		<input type = "hidden" name = "pageNo" id = "pageNo" value = "1">
		<input type = "hidden" name = "listSize" id = "listSize" value = "10">
		<div>
			<select name = "searchType" id = "searchType">
				<option value = "">선 택</option>
				<option value = "mem_name" >작성자</option>
				<option value = "board_subject">제   목</option>
				<option value = "board_subject||board_content">제목+내용</option>
			</select>
			<input type = "text" name = "searchTxt" id = "searchTxt">
			<input type = "button" name = "btn" id = "btn" value = "검색">
			<input type = "date" name = "stDate" id = "stDate" autocomplete="off"> ~ <input type = "date" name = "endDate" id = "endDate" autocomplete="off">
		</div>
		
		<div>
		<input type = "button" name = "regBtn" id = "regBtn" value = "글쓰기" onclick = "location.href='write.go'">
		<input type="button" value="선택삭제" class="btn btn-outline-info" onclick="deleteValue();">
	</div>
	
	</form>
	
	ㅋ
	<button onclick='location.href= "excel";'>엑셀다운</button>

	
	<form name = "listFrm" id = "listFrm">
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

</form>

</body>
</html>