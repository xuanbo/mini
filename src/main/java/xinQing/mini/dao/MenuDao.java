package xinQing.mini.dao;

import org.springframework.stereotype.Repository;
import xinQing.mini.entity.Menu;

import java.util.List;

/**
 * MenuDao
 *
 * Created by xuan on 16-12-1.
 */
@Repository
public interface MenuDao {

    /**
     * 根据parentId查询menu
     *
     * @param parentId 父级菜单id
     * @return  父级菜单下面的子菜单
     */
    List<Menu> selectByParentId(Integer parentId);

}
