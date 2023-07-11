package com.study.board.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository // 
public class BbsDAO {

    @Autowired // 의존성 주입
    private SqlSessionTemplate sqlSessionTemplate;

    public List<BbsTblVO> selectBbsList(BbsTblVO vo) throws Exception {
        return sqlSessionTemplate.selectList("selectBbsList", vo);
    }

}
