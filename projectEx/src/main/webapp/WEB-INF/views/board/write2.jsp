<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/validCheck.js"></script>
<script type="text/javascript" src="resources/check.js"></script>
<script type="text/javascript" src="resources/jQuery.js"></script>
</head>

<script>
  var arrInput = new Array(0);
  var arrInputValue = new Array(0);
 
function addInput() {
  arrInput.push(arrInput.length);
  arrInputValue.push("");
  display();
}
 
function display() {
  document.getElementById('parah').innerHTML="";
  for (intI=0;intI<arrInput.length;intI++) {
    document.getElementById('parah').innerHTML+=createInput(arrInput[intI], arrInputValue[intI]);
  }
}
 
function saveValue(intId,strValue) {
  arrInputValue[intId]=strValue;
}  
 
function createInput(id,value) {
  return "<input type='file' name = 'file'   id='test "+ id +"' onChange='javascript:saveValue("+ id +",this.value)' value='"+ 
 
value +"'><br>";
}
 
function deleteInput() {
  if (arrInput.length > 0) { 
     arrInput.pop(); 
     arrInputValue.pop();
  }
  display(); 
}

</script>
<body>

	<c:choose>
		<c:when test="${reg eq 'reg'}">

			<form action="wirte.do" onsubmit="return call();" name="form" >
			<table></table>
				작성자: <input name="mem_name" id="mem_name"> <br> 아이디: <input
					name="mem_id" id="mem_id"> <br> 제목: <input
					name="board_subject" id="board_subject"> <br> 내용:
				<textarea rows="" cols="" name="board_content" id="board_content"></textarea>
				<br>
				<button>등록</button>
				<div id="parah"></div>


				
			</form>


		</c:when>

		<c:when test="${upt eq 'upt'}">
c:c:
			<form action="update.do" onsubmit="return call();" name="form">
				작성자: <input name="mem_name" id="mem_name"> <br> 아이디: <input
					name="mem_id" id="mem_id"> <br> 제목: <input
					name="board_subject" id="board_subject"> <br> 내용:
				<textarea rows="" cols="" name="board_content" id="board_content"></textarea>
				<br> <input name="seq" type="hidden" value="${param.seq }">

				<button>수정</button>

				<div id="parah"></div>


			</form>
		</c:when>
	</c:choose>

	<div>
		<input type="button" value="추가" onclick="addInput();" /> 
		<input type="button" value="삭제" onclick="deleteInput();" />
	</div>


</body>
</html>