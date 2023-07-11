package com.study.board.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public UserTblVO selectOneUser(UserTblVO vo) throws Exception {

        // SELECT * FROM USER_TBL WHERE USERID='jsh' AND USERPW='1234';
        return sqlSessionTemplate.selectOne("selectOneUser", vo);
    }
    
}
