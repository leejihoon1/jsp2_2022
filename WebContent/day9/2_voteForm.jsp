<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 점심메뉴 투표하기</title>
</head>
<body>
<h3>오늘의 점심 메뉴 투표하기</h3>
<div>
	<c:if test="${user!=null}">   <!-- 로그인 완료 되었을 때 화면에 표시 -->
		<h5>${user.name } 님 환영합니다 !</h5>
	</c:if>
</div>
<form action="3_save.jsp">
	<fieldset>
		<input type="radio" name="menu" value="쌀국수" id="menu1"> 
		<label for="menu1">쌀국수</label>	<br>
		<input type="radio" name="menu" value="짬뽕" id="menu2">
		<label for="menu2">짬뽕</label>	<br>
		<input type="radio" name="menu" value="삼겹살" id="menu3">
		<label for="menu3">삼겹살</label>	<br>
		<input type="radio" name="menu" value="오늘의백반" id="menu4">
		<label for="menu4">오늘의백반</label>	<br>
		<input type="radio" name="menu" value="치킨샐러드" id="menu5">
		<label for="menu5">치킨샐러드</label>	<br>
	</fieldset>
	<div style="padding-top: 10px">
	<button type="button" onclick="validcheck()">투표하기</button>
	<button type="button" onclick="location.href='5_resultView.jsp'">결과보기</button> 
	<!-- <button type="button" onclick="location.href='4_result.jsp'">결과보기</button> -->
	<!-- 투표관리자만 사용할 수 있는 기능 -->
	<button type="button" onclick="location.href='6_clear.jsp'">투표초기화</button>
	<button type="button" onclick="location.href='../day8/5_home.jsp'">홈</button>
	</div>
	<div id="message" style="color:tomato;padding-top:10px;">
	
	</div>
	<script type="text/javascript">
		document.getElementById('message').innerHTML =
				'${message}';	//el은 getAttribute
		function validcheck(){
			const menu = document.forms[0].menu.value;
			if('${user}' == ''){ //session 객체의 user 애트리뷰트를 가져옵니다.(user가 널일때 ${user}은 '')
				alert('로그인을 하고 투표를 하세요!');
				location.href='../day8/3_loginForm.jsp';
			}else{
				if(menu==""){
					alert('메뉴를 선택하고 투표하세요!');
				}else{
					document.forms[0].submit();
				}
			}
		}
	</script>
</form>
</body>
</html>