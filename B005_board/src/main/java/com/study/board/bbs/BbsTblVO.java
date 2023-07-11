package com.study.board.bbs;

import lombok.Data;

@Data
public class BbsTblVO {

    // 파생속성(계산 때문에 필요한 속성)
    private String pageNum; // 몇번째 페이지인가?
    private String rowPerPage; // 한 페이지당 몇 개의 로우를 보여줄 것인가?

    // 기본속성
    private String userId;
    private String seq;
    private String title;
    private String content;
    private String divi;
    private String regdate;
}
