package com.study.board.bbs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDAO {
    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    public int selectBbsRowCount() throws Exception {
        return sqlSessionTemplate.selectOne("selectBbsRowCount");
    }

    public List<BbsTblVO> selectBbsList(BbsTblVO vo) throws Exception {
        return sqlSessionTemplate.selectList("selectBbsList", vo);
    }
}
