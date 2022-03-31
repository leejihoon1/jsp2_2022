<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//투표 실행은 여기서 부터.
	//처리내용 예시
	//투표하려면 로그인해야한다. 또는 로그인 없이 투표할 수 있다.

	String vote_yn = request.getParameter("vote");
	if(vote_yn!=null && vote_yn.equals("n"))
		request.setAttribute("message", "투표참여자가 아직 없습니다. 투표 후 결과를 보세요!");
	if(vote_yn!=null && vote_yn.equals("c"))
		request.setAttribute("message", "다음투표는 최근 투표 3분 후에 할 수 있습니다!");
	pageContext.forward("2_voteForm.jsp");
	
	/*
	1_lunchVote.jsp
	- 투표화면 보여주기
	- 투표참여자 없을 때 메시지 애트리뷰트 저장
	
	2_vote_Form.jsp
	- 투표참여 화면
	- 투표하기, 결과보기, 초기화, 홈 버튼
	
	3_save.jsp
	- 1번에서 투표한 내용으로 vote 애트리뷰트 수정
	- vote 애트리뷰트 없는 첫번째 투표는 Map 객체를 생성하고 초기값 설정하기
	
	4_result.jsp
	- 투표결과 항목별 출력
	- 전체 투표수 계산
	
	5_reaultView.jsp
	
	6_clear.jsp
	- 투표 초기화
	
	*/
%>

