package name.lkk.common.enume;

/**
 * @author kirklin
 * @author kirklin
 */

public enum OrderStatusEnum {
    CREATE_NEW(0,"待付款"),
    PAYED(1,"已付款"),
    SENDER(2,"已发货"),
    RECEIVED(3,"已完成"),
    CANCELED(4,"已取消"),
    SERVICING(5,"售后中"),
    SERVICED(6,"售后完成");
    private Integer code;
    private String msg;

    OrderStatusEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
