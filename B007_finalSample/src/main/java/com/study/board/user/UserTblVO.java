package com.study.board.user;

import lombok.Data;

@Data // Getter, Setter 등 후처리를 자동으로 해주는 어노테이션
public class UserTblVO {
    // VO의 용도: 데이터 전달(요청이 들어옴-VO로 받음-DAO로 이동-DB로 가서 값을 받아옴)
    private String userId;
    private String userPw;
    private String email;
    private String name;
    private String address;
}
