<%@page import="test.vo.User"%>
<%@page import="hrd.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("userid");
	String password = request.getParameter("password");
	
	MemberDao dao = MemberDao.getInstance();
	User user = dao.login(email, password);
	
	if(user==null){ // userid 또는 password가 옳지 않을 때 
		response.sendRedirect("5_home.jsp?login=n");	//파라미터 처리하는 방법
	}else{
	//session 객체에 사용자 정보를 저장 : 로그인 완료
		session.setAttribute("user", user);
		response.sendRedirect("5_home.jsp?login=y");	//파라미터 처리하는 방법
	}
	
	/* response.sendRedirect() 는 새로운 요청을 보내는것이고요
		pageContext.forward() 는 기존의 요청을 전달해요
		그래서 pageContext.forward() 는 request 에 애트리뷰트 저장해보냅니다.session 애트리뷰트를 저장할때에는 모든 jsp페이지에서 데이터를 사용할수 있게되고요
		request에 애트리뷰트를 저장할 때에는 pageContext.forward 로 전달할때 그 jsp페이지에서 1번만 데이터를 사용할수 있어요
		목적이 달라요
		session 에는 말그대로 사용자연결정보와 관련된 데이터, request 에는 출력화면에 보낼 데이터를 저장하는거에요
 	*/
%>