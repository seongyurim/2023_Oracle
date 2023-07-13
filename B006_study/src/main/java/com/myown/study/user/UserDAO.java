package com.myown.study.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

    @Autowired
    private SqlSession sqlSessionTemplete;

    public UserTblVO selectOneUser(UserTblVO vo) throws Exception {
        return sqlSessionTemplete.selectOne("selectOneUser", vo);
    }
    
}
