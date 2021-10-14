//JS  유효성검사 라이브러리 완성 ^^


// 일반적으로 유효성 검사하는 것들
// 함수형태로 정리해서
// 나중에 필요할때 쓸라고(쓰기 편하게)
// .jar 쓰던것처럼 (lib)


// 문제가 있으면 true, 괜찮으면 false


// <input>을 넣으면..
// 거기에 글자가 없으면 true, 있으면 false


function isEmpty(input) {
	return !input.value;	// 값이 없다.
}
function chk_input_filter(type, obj){

	var str = $(obj).val();

	if(type == 'alphabet'){
		//영문만 허용
		$(obj).val(str.replace(/[^a-z]/gi,""));
	}else if(type == 'number'){
		//숫자만 허용
		$(obj).val(str.replace(/[^0-9]/gi,""));
	}else if(type == 'alphabet_number'){
		//영문 , 숫자만 허용
		$(obj).val(str.replace(/[^a-z0-9]/gi,""));
	}else if(type == 'non_spec'){
		$(obj).val(str.replace(/[~!@#$%^&*()_+|<>?:;{}`\-\=\\\,.'"\[\]/]/gi,""));
	}else if(type == 'name'){
		//특수문자, 숫자 비허용
		$(obj).val(str.replace(/[~!@#$%^&*()_+|<>?:;{}`\-\=\\\,.'"\[\]/0-9]/gi,""));
	}
}    
// <input>랑 글자 수를 넣으면
// 그 글자 수보다 적으면 true, 아니면 false

function lessThan(input, length) {

	return input.value.length < length;

}
function moreThan(input, length) {

	return input.value.length > length;

}

function notEquals(input1, input2){
	 return input1.value != input2.value;
}




// <input>을 넣으면
// 한글/특수문자 들어있으면 true, 아니면 false
//있으면  0 없으면 -1 하나씩이니까 다른 숫자 신경쓸 필요없다. 

function containKR(input) {

	let ok = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
	for(let i = 0; i < input.value.length; i++){
		if(ok.indexOf(input.value[i]) == -1){
			return true;
		}
		
	}
}

// Test

// <input> x 2 넣으면 (비밀번호 재확인에 쓸꺼)
// 내용이 다르면 true, 아니면 false



// <input>, 문자열 세트
// 그 문자열 세트가 포함 안되있으면 true
// 들어있으면 false

function notContains(input, set){
	// input : qwerASD
	// set : 1234567890
	
	for(let i = 0; i < set.length; i++){
		
		if(input.value.indexOf(set[i]) != -1){
			return false;
		}
	}
	return true;
}


// <input>을 넣어서
// 숫자가 아니면 true, 숫자면 false

function isNotNumber(input){
	return isNaN(input.value);
}













