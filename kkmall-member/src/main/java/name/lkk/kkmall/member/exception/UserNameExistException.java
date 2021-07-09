package name.lkk.kkmall.member.exception;


public class UserNameExistException extends RuntimeException {
    public UserNameExistException() {
        super("用户名存在");
    }
}
