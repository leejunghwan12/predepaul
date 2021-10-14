
function call() {
	let memName = document.getElementById('mem_name');
	let memId = document.getElementById('mem_id');
	let boardSubject = document.getElementById('board_subject');
	let boardContent = document.getElementById('board_content');
	
	if (isEmpty(memName)||isEmpty(memId)||isEmpty(boardSubject)||isEmpty(boardContent)) {
		alert('공백없이 입력해주세요.');
		return false;
	}
	

	
	return true;
}




