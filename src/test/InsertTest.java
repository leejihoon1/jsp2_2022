package test;

import hrd.dao.MemberDao;
import hrd.vo.Member;

public class InsertTest {
	public static void main(String[] args) {

		MemberDao dao =MemberDao.getInstance();
//		int custno = dao.getNextSeq();
//		System.out.println("next seq : " + custno);
//		Member vo = new Member(custno, "김다현", "010-7788-0909", "경기도 안양시", null, "A", "22");
//		
//		if(dao.insert(vo)!=0)
//			System.out.println("회원등록이 완료되었습니다.");
		int custno2 = 100037;  //custno 컬럼에 조재하는 값과 없는 값 모두 테스트 해보세요.
		Member vo2 = new Member(custno2, "김다현", "010-7788-0909", "서울시 종로구 종로1가", null, "C", "22");
		int result = dao.update(vo2); // 테이블 특정 행 데이터 수정
		System.out.println("update 결과 : " + result);
	}
}
