public class App {

    public static void usedMember1() {        
        Member m1 = new Member("홍길동", "의적");
        System.out.println(m1.getName());
        System.out.println(m1.getNickname());
    }

    public static void usedMember2(Member member) {        
        Member m1 = member;
        System.out.println(m1.getName());
        System.out.println(m1.getNickname());
    }

    public static void main(String[] args) throws Exception {
        
        // 메인함수에서 컨트롤할 수 있는 게 하나도 없다.
        // 즉 usedMember1()와 이 함수 안에서 사용하는 객체 등은
        // 메인함수와 독립적으로 존재한다.
        usedMember1();

        // usedMember2()는 외부에서 이 함수가 사용하는 객체를 파라미터로 넘긴다.
        // 따라서 usedMember2()는 메인함수에서 관리될 수 있다.
        Member mem = new Member("홍길동", "의적");
        usedMember2(mem);

    }
}