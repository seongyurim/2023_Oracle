public class Member {
    
    String name;
    String nickname;

    public Member() {
        name = "";
        nickname = "";
    }

    public Member(String name, String nickname) {
        this.name = name;
        this.nickname = nickname;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickname() {
        return this.nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    
}
