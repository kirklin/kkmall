package name.lkk.common.constant;

/**
 * 购物车常量
 *
 * @author kirklin
 */
public class CartConstant {
    /**
     * 购物车临时用户COOKIE
     */
    public static final String TEMP_USER_COOKIE_NAME = "user-key";
    /**
     * 购物车临时用户COOKIE过期时间
     */
    public static final int TEMP_USER_COOKIE_TIME_OUT = 60 * 60 * 24 * 30;

    public final static String CART_PREFIX = "kkmall:cart:";
}
