<%@page import="hrd.vo.Member"%>
<%@page import="java.util.List"%>
<%@page import="hrd.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	MemberDao dao = MemberDao.getInstance();
	List<Member>list = dao.selectAll();

	request.setAttribute("list", list);
	pageContext.forward("4_memberlist.jsp"); // 사용자 뷰 화면 파일
	
	//memberlist.jsp 파일의 기존코드를 jstl과 el을 적용해서 수정하세요.
%>