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
var Keyname;
const arrayToMap = new Map();
var cnt;
$(function(){
	//����
	$('#saveBtn').click(function(){
		if(!window.localStorage){
			//��� �������� HTML5 ���ý��丮�� �����ؼ� �� ������ �� �ᵵ ��.
			alert("���� �������� ���ý��丮���� �������� �ʽ��ϴ�");
			return false;
		}
		//���ý��丮�� �����ϴ� 3���� ���. �� ���� ���.
		localStorage.setItem("key1", "�ȳ�"); //�Լ� �̿�. key-value
		localStorage.key2 = "HI";
		localStorage["key3"] = "HELLO";
	});
	
	//����
	$('#deleteBtn').click(function(){
		localStorage.removeItem("key1"); //Ű�� �Է��ϸ� ��
	});
	
	//��ü����
	$('#deleteAllBtn').click(function(){
		localStorage.clear(); //localStorage�� �ִ� ��� ������ ����... �����ؼ� ���!
		document.getElementById("box").innerText = '';
	});
	
	//���뺸��
	$('#showBtn').click(function(){
		alert(localStorage.getItem("key1")+","+localStorage.key2+","+localStorage["key3"]);
	});
});
function showStorge(){

	if(localStorage.length > 0){
		//���뺸��
		for(var i =0; i < localStorage.length; i++){
		   arrayToMap.set(localStorage.key(i), localStorage.getItem(localStorage.key(i)));
		}
		
		var mapToArray = [...arrayToMap];
		mapToArray = mapToArray.sort((a, b) => b[1] - a[1]);
		console.log(mapToArray);
		//alert(mapToArray.length);
		if(mapToArray.length > 10){
			cnt = 10;
		} else {
			cnt = mapToArray.length;
		}
		
		for(let i = 0; i < cnt; i++) {
		var resultmap = mapToArray[i];
		createDiv(resultmap[0], resultmap[1]);
		//alert(resultmap[0]);
		
		}
	}
}
function createDiv(key, value) {
    const item = document.createElement("li");
    const span = document.createElement("span");
    const button = document.createElement("button");
    item.id = 'storagePa' + value;
    span.id = 'storage' + value;
    span.innerText = key;
    button.innerText = 'x';
    button.addEventListener("click", deleteSto);
    item.appendChild(span);
    item.appendChild(button);
  	document.getElementById("box").appendChild(item);
    
	} 
	


function deleteSto(e) { 	
	key = e.target.parentElement.innerText;
	key = key.substring(0, key.length-1);
	localStorage.removeItem(key);
	
    const li = e.target.parentElement;
    li.remove();
};

function inputStorage(){
	//alert(localStorage.length);
	
	value = date();
	key = $("#inputBox").val();
	
	 localStorage.setItem(key, value);
}
function date(){
	const now = new Date();
	value = String(now.getFullYear()) + String(now.getMonth()) + String(now.getDate()) + String(now.getHours()) + String(now.getMinutes()) + String(now.getSeconds());
	//alert(value);
	return value;
}
</script>
</head>
<body>
<button id="saveBtn">����</button>
<button id="deleteBtn">����</button>
<button id="deleteAllBtn">��ü����</button>
<button id="showBtn">���뺸��</button>

<input type="text" id="inputBox">
<button id="saveInputBtn" onClick="inputStorage()">����</button>
<button id="showInputBtn" onClick="showStorge()">���뺸��</button>
<div id="box"></div>
</body>
</html>