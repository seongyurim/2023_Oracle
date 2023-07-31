package com.uuidtest.demo.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public int insertMemberTbl(MemberVO vo) throws Exception {
        return sqlSessionTemplate.insert("insertMemberTbl", vo);
    }    
}
