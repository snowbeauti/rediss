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
	});
	
	//���뺸��
	$('#showBtn').click(function(){
		alert(localStorage.getItem("key1")+","+localStorage.key2+","+localStorage["key3"]);
	});
});

function showStorge(){
	
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
	

	for(let i = 0; i <= cnt; i++) {

	var resultmap = mapToArray[i];
	createDiv(resultmap[0]);
	//alert(resultmap[0]);
	
	}
}


function createDiv(word) {
	  const newDiv = document.createElement('div');
	  const newText = document.createTextNode(word);
	  newDiv.appendChild(newText);
	  document.getElementById("box").appendChild(newDiv);

	  newDiv.setAttribute("class","myDiv");
	  newDiv.style.backgroundColor="yellow";
	} 

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

<input type="text" id="inputBox"">
<button id="saveInputBtn" onClick="inputStorage()">����</button>
<button id="showInputBtn" onClick="showStorge()">���뺸��</button>
<div id="box">�ڽ�����</div>
</body>
</html>