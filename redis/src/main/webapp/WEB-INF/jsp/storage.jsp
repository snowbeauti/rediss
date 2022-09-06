<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Local Storage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
var key;
var value;
var Keyname;
const arrayToMap = new Map();
var arrStorage = new Array();
var resultmap = new Array();
var cnt;


$(function(){
	//저장
	$('#saveBtn').click(function(){
		if(!window.localStorage){
			//모든 브라우저가 HTML5 로컬스토리지 지원해서 이 구문은 안 써도 됨.
			alert("현재 브라우저는 로컬스토리지를 지원하지 않습니다");
			return false;
		}
		//로컬스토리지 저장하는 3가지 방법. 다 같은 방법.
		localStorage.setItem("key1", "안녕"); //함수 이용. key-value
		localStorage.key2 = "HI";
		localStorage["key3"] = "HELLO";
	});
	
	//삭제
	$('#deleteBtn').click(function(){
		localStorage.removeItem("key1"); //키만 입력하면 됨
	});
	
	//전체삭제
	$('#deleteAllBtn').click(function(){
		localStorage.clear(); //localStorage에 있는 모든 내용을 삭제... 주의해서 사용!
	});
	
	//내용보기
	$('#showBtn').click(function(){
		alert(localStorage.getItem("key1")+","+localStorage.key2+","+localStorage["key3"]);
	});
});

function showStorge(){
	
	if(localStorage.length > 0){
		//내용보기
		for(var i =0; i < localStorage.length; i++){
		   arrayToMap.set(localStorage.key(i), localStorage.getItem(localStorage.key(i)));
		}

		console.log(arrayToMap);
		var mapToArray = [...arrayToMap];
		mapToArray = mapToArray.sort();
		console.log(mapToArray);
		if(mapToArray.length > 10){
			cnt = 10;
		} else {
			cnt = mapToArray.length;
		}
		
	
		for(let i = 0; i < cnt; i++) {
	
		resultmap = mapToArray[i];
		

		console.log(resultmap);
		key = resultmap[0];
		value = resultmap[1];
		console.log("key", key, "value", value);
		
		createDiv(key, value);
		
		}
	}
}


function createDiv(key, value) {
	 var html = '';
	 html += '<div id="storagePa'+key+'" style="display: flex; margin-bottom: 5px;"><div style="display: flex; width: 100px;">' + value + '</div><div style="display: flex; width: 50px;" id="storage'+key+'">X</div></div>';
	 $('#box').prepend(html);
	} 

function inputStorage(){
	
	key = date();
	value = $("#inputBox").val();
	
	 localStorage.setItem(key, value);
}

function date(){
	const now = new Date();
	value = String(now.getFullYear()) + String(now.getMonth()) + String(now.getDate()) + String(now.getHours()) + String(now.getMinutes()) + String(now.getSeconds());
	return value;
}

$(document).on("click", "#box", function(e){
	var storageId= e.target.id.replace('storage','');
	var paranetId = 'storagePa' + storageId;
	$('#'+paranetId).css( "display", "none" );
	localStorage.removeItem(storageId);
});
</script>
</head>
<body>
<button id="saveBtn">저장</button>
<button id="deleteBtn">삭제</button>
<button id="deleteAllBtn">전체삭제</button>
<button id="showBtn">내용보기</button>

<input type="text" id="inputBox">
<button id="saveInputBtn" onClick="inputStorage()">저장</button>
<button id="showInputBtn" onClick="showStorge()">내용보기</button>
<div id="box">박스여기</div>
</body>
</html>