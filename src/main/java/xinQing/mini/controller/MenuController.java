package xinQing.mini.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import xinQing.mini.entity.Menu;
import xinQing.mini.service.MenuService;

import java.util.List;

/**
 * Created by xuan on 16-10-23.
 */
@Controller
@RequestMapping("/core/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    /**
     * 根据父级菜单id查询子菜单
     *
     * @param parentId 父级菜单id
     * @return 父级菜单下面的子菜单
     */
    @RequestMapping(value = "/selectByParentId", method = RequestMethod.GET)
    public @ResponseBody List<Menu> selectByParentId(@RequestParam(required = false, defaultValue = "0") Integer parentId) {
        return menuService.selectByParentId(parentId);
    }
}
