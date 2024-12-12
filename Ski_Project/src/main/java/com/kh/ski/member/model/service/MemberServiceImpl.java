package com.kh.ski.member.model.service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.kh.ski.member.model.dao.MemberDao;
import com.kh.ski.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {


	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private MemberDao memberDao;

    private final RestTemplate restTemplate = new RestTemplate();

    @Override
    public Member loginMember(Member m) {
        return memberDao.loginMember(sqlSession, m);
    }

    @Override
    @Transactional
    public int insertMember(Member m) {
        return memberDao.insertMember(sqlSession, m);
    }

    @Override
    @Transactional
    public int updateMember(Member m) {
        return memberDao.updateMember(sqlSession, m);
    }

    @Override
    @Transactional
    public int deleteMember(String memberId) {
        return memberDao.deleteMember(sqlSession, memberId);
    }

    @Override
    public int idCheck(String checkId) {
        return memberDao.idCheck(sqlSession, checkId);
    }

    @Override
    public int sendCertNo(String email) {
        return memberDao.sendCertNo(sqlSession, email);
    }

    @Override
    public int validate(String email, String certNo) {
        return memberDao.validate(sqlSession, email, certNo);
    }

    @Override
    @Transactional
    public int insertEmailCert(String email, String certNo) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("email", email.trim().toLowerCase());
        paramMap.put("certNo", certNo);
        return memberDao.insertEmailCert(sqlSession, paramMap);
    }

    @Override
    public String findId(String memberName, String email) {
        return memberDao.findId(sqlSession, memberName, email);
    }

	@Override
	public String findPwd(String memberId, String email) {
		// TODO Auto-generated method stub
		return memberDao.findPwd(sqlSession, memberId, email);
	}

	@Override
	public int updatePassword(String memberId, String tempPwd) {
		// TODO Auto-generated method stub
		return memberDao.updatePassword(sqlSession, memberId, tempPwd);
	}

	/*
	@Override
	public int changePwd(int memberNo, String newPwd, String currentPwd) {
		// TODO Auto-generated method stub
		return memberDao.changePwd(sqlSession, memberNo, newPwd, currentPwd);
	}
*/
	/*
	@Override
	public int changePwd(int memberNo, String newPwd, String currentPwd) {
	    // 1. DB에서 암호화된 기존 비밀번호 조회
	    String encCurrentPwd = memberDao.selectEncPw(sqlSession, memberNo);

	    // 2. 입력된 현재 비밀번호와 DB의 비밀번호 비교
	    if (!bcryptPasswordEncoder.matches(currentPwd, encCurrentPwd)) {
	        return 0; // 현재 비밀번호 불일치
	    }

	    // 3. 새 비밀번호 암호화
	    String encNewPwd = bcryptPasswordEncoder.encode(newPwd);

	    // 4. 암호화된 새 비밀번호를 DB에 저장
	    return memberDao.changePwd(sqlSession, memberNo, encNewPwd);
	}
*/
	
	@Override
	public int changePwd(int memberNo, String newPwd, String currentPwd) {
	    // 1. DB에서 암호화된 기존 비밀번호와 임시 비밀번호 조회
	    String encCurrentPwd = memberDao.selectEncPw(sqlSession, memberNo);
	    String encTempPwd = memberDao.selectTempPw(sqlSession, memberNo);

	    // 2. 현재 비밀번호와 DB 비밀번호 비교
	    if (!bcryptPasswordEncoder.matches(currentPwd, encCurrentPwd) &&
	        (encTempPwd == null || !bcryptPasswordEncoder.matches(currentPwd, encTempPwd))) {
	        return 0; // 현재 비밀번호 불일치
	    }

	    // 3. 새 비밀번호 암호화
	    String encNewPwd = bcryptPasswordEncoder.encode(newPwd);

	    // 4. DAO 호출
	    return memberDao.changePwd(sqlSession, memberNo, encNewPwd);
	}
	@Override
	public String selectEncPw(int memberNo) {
		// TODO Auto-generated method stub
		return memberDao.selectEncPw(sqlSession, memberNo);
	}

	@Override
	public String selectTempPw(int memberNo) {
		// TODO Auto-generated method stub
		return memberDao.selectTempPw(sqlSession, memberNo);
		
	}

	
//    @Override
//    @Transactional
//    public Member processKakaoUser(Map<String, Object> userInfo) {
//        String kakaoId = String.valueOf(userInfo.get("id"));
//        String email = (String) userInfo.get("email");
//        String nickname = (String) userInfo.get("nickname");
//
//        // 기존 카카오 로그인 사용자 확인
//        Member existingMember = memberDao.findKakaoMember(sqlSession, kakaoId);
//
//        if (existingMember == null) {
//            // 신규 사용자
//            Member newMember = new Member();
//            newMember.setKakaoLogin(kakaoId); // 카카오 고유 ID 저장
//            newMember.setEmail(email);
//            newMember.setMemberName(nickname);
//            newMember.setMemberStatus("Y");
//            memberDao.insertKakaoMember(sqlSession, newMember);
//            return newMember;
//        } else {
//            // 기존 사용자 반환
//            return existingMember;
//        }
//    }
    
    
}