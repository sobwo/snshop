package com.myteam.myapp.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myteam.myapp.domain.MemberVo;
import com.myteam.myapp.persistance.MemberService_Mapper;

@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService{
	private MemberService_Mapper msm;

	@Autowired
	public MemberServiceImpl(SqlSession sqlSession) {
		this.msm = sqlSession.getMapper(MemberService_Mapper.class);
	}

	@Override
	public int memberInsert(String memberId, String memberPw, String memberName, String memberEmail, String memberPhone,
			String memberGender) {
		MemberVo mv = new MemberVo();
		
		mv.setMemberId(memberId);
		mv.setMemberPw(memberPw);
		mv.setMemberName(memberName);
		mv.setMemberEmail(memberEmail);
		mv.setMemberPhone(memberPhone);
		mv.setMemberGender(memberGender);
		
		int value = msm.memberInsert(mv);
		
		return value;
	}

	@Override
	public int memberIdCheck(String memberId) {
		int value = msm.memberIdCheck(memberId);
		return value;
	}

}
