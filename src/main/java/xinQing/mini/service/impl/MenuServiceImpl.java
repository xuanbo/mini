package xinQing.mini.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xinQing.mini.dao.MenuDao;
import xinQing.mini.entity.Menu;
import xinQing.mini.service.MenuService;

import java.util.List;

/**
 * Created by xuan on 16-12-1.
 */
@Transactional
@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuDao menuDao;

    @Override
    @Transactional(readOnly = true)
    public List<Menu> selectByParentId(Integer parentId) {
        return menuDao.selectByParentId(parentId);
    }
}
