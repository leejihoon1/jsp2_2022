<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session Test</title>
</head>
<body>
<div>http 프로토콜은 stateless(상태정보유지안됨), 비연결 지향  <br>
	(참고로 카카오톡은 연결지향).
	-> 웹서버와 브라우저 사이의 연결정보를 저장하는 방법을 사용합니다. <br>
	-> request 를 통해서 브라우저의 세션ID가 부여되고 그 값으로 구별 <br>
	-> 로그인 기능 구현에 활용합니다. <br>
	-> 톰캣은 이름 JSESSIONID 값을 만듭니다. <br>
	-> 세션 유효시간은 서버에서 설정합니다  web.xml 확인 (모든 프로젝트에 적용) <br>
</div>
<%
	String id = session.getId();
	out.print("sessionid :" + id);
	out.print("<br>");
	
	long create = session.getCreationTime(); // 세션이 만들어진 시간 - 처음 요청을 보낸 시간
	out.print("session 생성 시간  :" + create);
	out.print("<br>");
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	out.print("session 생성시간 :" + df.format(create));
	out.print("<br>");
	
	long exp = session.getMaxInactiveInterval();
	out.print("session 유효시간 :" + exp + "(초)");  // 기본값 30분(1800초)
	out.print("<br>");
	/* 서버의 web.xml 설정내용
	    <session-config>
        	<session-timeout>30</session-timeout>
    	</session-config>
	*/
	
	long last = session.getLastAccessedTime(); //같은 세션ID로 요청한 최근 시간 
	out.print("session 마지막 접속시간  :" + last);
	out.print("<br>");
	out.print("session 마지막 접속시간 :" + df.format(last));
	out.print("<br>");
	
	/* 로그인 : session 객체 애트리뷰트를 저장하는 방법으로 구현합니다. */
%>
</body>
</html>