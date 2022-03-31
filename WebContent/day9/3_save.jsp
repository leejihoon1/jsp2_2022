<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//투표내용 저장은 Map 컬렉션(자료구조)을 이용하고
	//application 객체의 애트리뷰트로 저장합니다(db사용안합니다.)
	
	Map<String,Integer> vote = 
	(Map<String,Integer>)application.getAttribute("vote");
	
	//투표항목 초기화  : vote 애트리뷰트 값이 없을 때
	if(vote==null){
		vote = new TreeMap<String,Integer>();
		vote.put("쌀국수",0);	
		//메뉴이름은 key,메뉴를 선택한 카운트는 value 입니다.
		vote.put("짬뽕",0);
		vote.put("삼겹살",0);
		vote.put("오늘의백반",0);
		vote.put("치킨샐러드",0);
	}
		//쿠키를 활용하여 3분 이내에 재투표 방지
		int status =0;	//쿠키이름 check값 없는 상태
		Cookie[] cookies = request.getCookies();
		for(Cookie c : cookies){
			if(c.getName().equals("CHECK")){
				status = 1; //쿠키이름 check값 있는 상태
				break;
			}
		}
		
		if(status==0){
		//선택하 메뉴 파라미터 가져오기
		String menu = request.getParameter("menu");
		//선택한 메뉴를 key로 했을 때 현재 value값 가져오기
		int cnt = vote.get(menu);
		//확인을 위한 출력
		System.out.println("menu:"+menu+",cnt:"+cnt);
		//value값을 +1 증가하여 변경하기
		vote.put(menu,++cnt);
		//변경된 vote를 애트리뷰트에 저장하기
		application.setAttribute("vote", vote);
		
		//투표 실시한 내용 쿠키로 저장하기
		Cookie cookie = new Cookie("CHECK","X87"); // 값은 의미없음.(체크안함)
		cookie.setMaxAge(3*60);	//3분, response.addCookie 보다 앞에서 실행해야함.
		response.addCookie(cookie);
				
		//같은 이름의 애트리뷰트에 대해 덮어쓰기
		//response.sendRedirect("4_result.jsp"); // 결과보기 화면
		response.sendRedirect("5_resultView.jsp"); // 결과보기 화면
		}else{ //투표 방지
			response.sendRedirect("1_lunchVote.jsp?vote=c");
		}
%>	