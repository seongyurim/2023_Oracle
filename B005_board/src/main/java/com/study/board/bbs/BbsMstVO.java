package com.study.board.bbs;

import java.util.List;
import lombok.Data;

@Data
public class BbsMstVO {
    // private int rowCount; // 현재 가지고 있는 모든 row의 개수
    private List<BbsTblVO> bbsList;
}
