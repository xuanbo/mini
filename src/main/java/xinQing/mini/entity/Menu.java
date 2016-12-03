package xinQing.mini.entity;

import java.io.Serializable;

/**
 * 菜单
 *
 * Created by xuan on 16-12-1.
 */
public class Menu implements Serializable {

    private Integer id;
    private Integer parentId;
    private String menuName;
    private String icon;
    private String url;
    private String level;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", parentId=" + parentId +
                ", menuName='" + menuName + '\'' +
                ", icon='" + icon + '\'' +
                ", url='" + url + '\'' +
                ", level='" + level + '\'' +
                '}';
    }
}
