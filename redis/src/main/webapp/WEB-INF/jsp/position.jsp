<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<button onclick="findLocation()">현재 위치의 위도와 경도</button>
	<p id="myLocation"></p>
<%-- ${list} --%>
</body>
</html>
  <script>
    navigator.geolocation.getCurrentPosition(function(pos) {
        console.log(pos);
        var latitude = pos.coords.latitude;
        var longitude = pos.coords.longitude;
        alert("현재 위치는 : " + latitude + ", "+ longitude);
    });
    

	var loc = document.getElementById("myLocation");
	
    function findLocation() {
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(showYourLocation, showErrorMsg);
		} else { 
			loc.innerHTML = "이 문장은 사용자의 웹 브라우저가 Geolocation API를 지원하지 않을 때 나타납니다!";
		}
	}

	function showYourLocation(position) {
		loc.innerHTML = "현재 사용자는 위도 " + position.coords.latitude + ", 경도 " + position.coords.longitude + "에 위치하고 있습니다.";	
	}

	function showErrorMsg(error) {
		switch(error.code) {
			case error.PERMISSION_DENIED:
			loc.innerHTML = "이 문장은 사용자가 Geolocation API의 사용 요청을 거부했을 때 나타납니다!"
			break;
			case error.POSITION_UNAVAILABLE:
			loc.innerHTML = "이 문장은 가져온 위치 정보를 사용할 수 없을 때 나타납니다!"
			break;
			case error.TIMEOUT:
			loc.innerHTML = "이 문장은 위치 정보를 가져오기 위한 요청이 허용 시간을 초과했을 때 나타납니다!"
			break;
			case error.UNKNOWN_ERROR:
			loc.innerHTML = "이 문장은 알 수 없는 오류가 발생했을 때 나타납니다!"
			break;
		}
	}
    </script>