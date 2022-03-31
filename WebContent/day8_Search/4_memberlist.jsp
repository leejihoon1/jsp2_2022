<%@page import="hrd.vo.Member"%>
<%@page import="hrd.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!-- 함수fn은 태그가 아닌 el과 함꼐 사용합니다. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회/수정</title>
<link rel="stylesheet" href="0_hrdkorea.css">
<style type="text/css">
	td{
		border: 1px solid gray;
	}
</style>
</head>
<body>
<%
	String find = request.getParameter("search_name");

	MemberDao dao =MemberDao.getInstance();
	List<Member> list = null;
	if(find ==null || find.length() ==0) 
		list = dao.selectAll();				//전체 리스트
	else	//파라미터 있을때
		list = dao.searchName(find);		//이름으로 조회한 리스트
%>
				
<div class="wrap_container">
  <header>
        <h3 class="header-item">쇼핑몰 회원관리 ver1.0</h3>
    </header>
    <nav class="haeder-nav">
        <ul class="container">
          	<li><a href="2_insertForm.jsp">회원등록</a></li>
            <li><a href="4_memberlist.jsp">회원목록조회/수정</a></li>
            <li><a href="7_saleList.jsp">회원매출조회</a></li>
            <li><a href="1_index.jsp">홈으로.</a></li>
        </ul>
    </nav>
	 <section>
            <h2 style="text-align: center;" class="section"><strong>회원목록조회/수정</strong></h2>
            <div>
            <!-- action url을 현재 url과 같게 했습니다. -->
			<form action="memberSearch.jsp">
				<select name="column" id="column">
					<option value="name">이름</option>
					<option value="address">주소</option>
					<option value="grade">고객등급</option>
					<option value="city">거주지역</option>
				</select>
				<!-- 아래 find는 2개중에 하나만 화면에 표시 -->
				<span id="content">
					<input name="find" placeholder="검색할 내용 입력" value="${find}">
				</span>
				<span id="grade">
					<select name="find" id="grades">
							<!-- 사용자 선택하는 텍스트와 db테이블에 저장된 값이 다릅니다. -->
							<option value="A">VIP</option>
							<option value="B">일반</option>
							<option value="C">직원</option>
					</select>
				</span>
				<button>검색</button>
				<button type="button" onclick="location.href='memberList.jsp'">전체보기</button>
			</form>            
            </div>
            <table style="width: 90%;margin: auto;text-align: center;"> 
                <tr style="text-align: center;">    
                    <td><strong>번호</strong></td>       
                    <td><strong>이름</strong></td>
                    <td><strong>연락처</strong></td>
                    <td><strong>주소</strong></td>
                    <td><strong>가입일자</strong></td>
                    <td><strong>고객등급</strong></td>
                    <td><strong>거주지역</strong></td>
                </tr>
<!-- el은 getAttribute 와 출력-->
<c:forEach var="member" items="${list}">
				<tr> 
					<td > <a style="color: blue;" href="">
					:${member.custNo}</a> 
					</td>
					<td>${member.custName}</td>
					<td>${member.phone}</td>
					<td>${member.address}</td>
					<td>${member.joinDate}</td>
					<td>${member.grade == 'A'? 'VIP' : (member.grade == 'B'? '일반' : '직원')}
					<!-- 조건연산형식 : 조건? 참실행명령문 : 거짓 실행명령문 -->
					<c:if test="${member.grade=='A'}">VIP</c:if>
					<c:if test="${member.grade=='B'}">일반</c:if>
					<c:if test="${member.grade=='C'}">직원</c:if>
					</td>
					<td>${member.city}</td>
				</tr>
</c:forEach>
		<!-- list의 데이터가 없을 때 list애트리뷰트가 null X, size가 0 (jstl의 length) 함수로 검사-->
 		<c:if test="${fn:length(list)==0 }">
	            <tr>
              		<td colspan="7">조회 결과가 없습니다.</td>
              	</tr>
        </c:if>
            </table>
        </section>
    <footer>
        <p>HRDKOREA Copyrightⓒ2016 All rights reserved. Human Resources Development Service of Korea</p>
    </footer>
    </div>
    <script type="text/javascript">
    			//const sel2 = document.getElementById('sel'); 	// 1개 요소만 가져옵니다.
    			//selector(., #, 태그이름, >)를 이용해서 여러개 요소 가져옵니다.
    	const sel = document.querySelectorAll("#column>option"); /* > 자식요소 */
    	console.log(sel);
    	//let status=1;		//forEach에서 상태체크할 때 사용할 변수
    	sel.forEach(function(item){
    		if(item.value=='${column}'){
    			item.selected='selected';
    		//	status=0; 		//column 애트리뷰트 값과 일치하는 option 항목일 때 입니다.
    		}
    	});
    	document.querySelectorAll("#grades>option").forEach(function(item){
    		if(item.value=='${find}'){
    			item.selected='selected';
    			//grade를 선택한 것에 따라 일치하는 option을 표시합니다.
    		}
    	});
    	/* 화면표시 변경 */
    	const grade = document.getElementById('grade');		
    	const content = document.getElementById('content');
    		if('${column}' == 'grade'){
    			grade.style.display='inline-block';
    			content.style.display = 'none';
    		}else{
    			content.style.display = 'inline-block';
    			grade.style.display = 'none';
    		}
    		
    		//grade.style.display = 'none'; // 안보이게 하는 방법
    		//검색 컬럼선택 column이 변경될 때
        	document.getElementById('column').addEventListener("change",changeView);
        	function changeView(){
        		const col = document.forms[0].column.value;
        		if(col=='grade'){
        			grade.style.display = 'inline-block';
        			content.style.display = 'none';
        		}else{
        			content.style.display = 'inline-block';
        			grade.style.display = 'none';
        		}
        	};
    </script>
    
</body>
</html>









