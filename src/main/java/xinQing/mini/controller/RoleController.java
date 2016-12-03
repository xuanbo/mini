package xinQing.mini.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import xinQing.mini.entity.Role;
import xinQing.mini.model.Pageable;
import xinQing.mini.service.RoleService;

/**
 * Created by xinQing on 2016/12/2.
 */
@RestController
@RequestMapping("/core")
public class RoleController {

    @Autowired
    private RoleService roleService;

    /**
     * 分页查询记录
     *
     * @param pageable 分页信息
     * @return PageInfo<Role>
     */
    @RequestMapping(value = "/role", method = RequestMethod.GET)
    public PageInfo<Role> role(Pageable pageable) {
        return roleService.getByPage(pageable);
    }

    /**
     * 根据id获取角色
     *
     * @param id 角色id
     * @return 角色信息
     */
    @RequestMapping(value = "/role/{id}", method = RequestMethod.GET)
    public Role getById(@PathVariable Integer id) {
        return roleService.getById(id);
    }

}
