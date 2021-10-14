<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script>
	$(function(){
		
		$("#wrtBtn").click(function(){
// 			$("#frm").attr("action","write").attr("method","post").submit();
			
			$("#frm").attr({"action":"write.do", "method":"post"}).submit();
		})
		
		$("#uptBtn").click(function(){
// 			$("#frm").attr("action","write").attr("method","post").submit();
			
			$("#frm").attr({"action":"update.do", "method":"post"}).submit();
		})
		
		var tmp = 1;
		$("#addFile").click(function(){
			var txt = "<input type=file name=file"+tmp+" id=file"+tmp+" onchange=fncFileCheck(this)><input type=button value=삭제 onclick=fncFileDelete(this)><br>";
			tmp +=1;
			$("#dvFile").append(txt);
		})
		
	})
	
	function fncFileDelete(fileBtn){
 			$(fileBtn).prev().remove();
 			$(fileBtn).next().remove();
			$(fileBtn).remove();
	}
	
	function fncFileCheck(fileInput){
		
// 		 var ext = $(fileInput).val().split(".").pop().toLowerCase();
		    
// 		    if($.inArray(ext,["gif","jpg","jpeg","png","bmp"]) == -1) {
// 		        alert("gif, jpg, jpeg, png, bmp 파일만 업로드 해주세요.");
// 		        $(fileInput).val("");
// 		        return;
// 		    }
		 
		    
// 		    var file  = fileInput.files[0];
// 		    var _URL = window.URL || window.webkitURL;
// 		    var img = new Image();
		    
// 		    img.src = _URL.createObjectURL(file);
		    
// 		    alert(img.src);
		    
// 		    img.onload = function() {
		        
// 		        if(img.width > 500 || img.height > 500) {
// 		            alert("이미지 가로 500px, 세로 500px로 맞춰서 올려주세요.");
// 		            $(fileInput).val("");
// 		        } 
// 		    }
		
	}
</script>
</head>
<body>
	<form name = "frm" id = "frm" enctype="multipart/form-data" accept-charset="UTF-8">
		<div>
			작성자 : <input type = "text" name = "name" id = "name" value = "${map.memName }"><br>
			아이디 : <input type = "text" name = "id" id = "id" value = "${map.memId }"><br>
			제   목 : <input type = "text" name = "subject" id = "subject" value = "${map.boardSubject }"><br>
			내   용 : <br>
			<textarea rows="5" cols="20" name = "content" id = "content">${map.boardContent }</textarea>
		</div>
		
		<div id = "dvFile">
			<input type = "button" name= "addFile" id = "addFile" value = "파일추가"><br>
		</div>
		
		<c:choose>
			<c:when test="${empty map}">
				<input type = "button" name = "wrtBtn" id = "wrtBtn" value = "등록">
			</c:when>
			<c:otherwise>
				<input type = "hidden" name = "seq" id = "seq" value = "${map.seq }">
				<input type = "button" name = "uptBtn" id = "uptBtn" value = "수정">
			</c:otherwise>
		</c:choose>
	</form>
</body>
</html>