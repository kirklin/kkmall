package name.lkk.kkmall.member.vo;

import lombok.Data;

@Data
public class SocialUser {

    private String accessToken;

    private String remindIn;

    private String expiresIn;

    private String uid;

    private String isrealname;
}