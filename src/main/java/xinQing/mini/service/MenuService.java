package xinQing.mini.service;

import xinQing.mini.entity.Menu;

import java.util.List;

/**
 * MenuService
 *
 * Created by xuan on 16-12-1.
 */
public interface MenuService {

    List<Menu> selectByParentId(Integer parentId);

}
