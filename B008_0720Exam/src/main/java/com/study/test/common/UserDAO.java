package com.study.test.common;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public UserVO selectOneUser(UserVO vo) throws Exception {
        return sqlSessionTemplate.selectOne("selectOneUser", vo);
    }

    public int insertUser(UserVO vo) throws Exception {
        return sqlSessionTemplate.insert("insertUser", vo);
    }
    
}
