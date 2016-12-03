package xinQing.mini.model;

/**
 * Created by xinQing on 2016/12/2.
 */
public class ServiceModel<T> {

    private Boolean flag;

    private T msg;

    public ServiceModel(Boolean flag, T msg) {
        this.flag = flag;
        this.msg = msg;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    public T getMsg() {
        return msg;
    }

    public void setMsg(T msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "ServiceModel{" +
                "flag=" + flag +
                ", msg='" + msg + '\'' +
                '}';
    }
}
