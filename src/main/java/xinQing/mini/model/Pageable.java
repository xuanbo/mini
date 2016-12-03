package xinQing.mini.model;

/**
 * 封装分页信息
 *
 * Created by xuan on 16-11-10.
 */
public class Pageable {

    private Integer current = 1;

    private Integer size = 10;

    private Integer offset = 0;

    private String orderBy;

    public Pageable() {
    }

    public Pageable(Integer current, Integer size, String orderBy) {
        this.current = current;
        this.size = size;
        this.orderBy = orderBy;
    }

    public Integer getCurrent() {
        return (current == null || current < 1) ? 1 : current;
    }

    public void setCurrent(Integer current) {
        this.current = current;
    }

    public Integer getSize() {
        return (size == null || size < 1) ? 10 : size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }

    public Integer getOffset() {
        offset = (getCurrent() - 1) * size;
        return offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    @Override
    public String toString() {
        return "Pageable{" +
                "current=" + current +
                ", size=" + size +
                ", offset=" + offset +
                ", orderBy='" + orderBy + '\'' +
                '}';
    }
}
