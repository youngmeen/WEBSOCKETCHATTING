<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에코</title>
<!-- jquery link 설정 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#sendBtn').click(function() {
			sendMessage();
		});
	});
	var wsocket;
	function sendMessage() {
		wsocket = new WebSocket("ws://localhost:8080/jeongjae/echo-ws");
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
		wsocket.onopen = function() {
			wsocket.send($("#message").val());
		};
	}
	function onMessage(evt) {
		var data = evt.data;
		alert("서버에서 데이터 받음: " + data);
		wsocket.close();
	}
	function onClose(evt) {
		alert("연결 끊김");
	}
</script>
</head>
<body>
	<input type="text" id="message">
	<input type="button" id="sendBtn" value="전송">
</body>
</html>


