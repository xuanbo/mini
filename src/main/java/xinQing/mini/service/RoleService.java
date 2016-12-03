package xinQing.mini.service;

import com.github.pagehelper.PageInfo;
import xinQing.mini.entity.Role;
import xinQing.mini.model.Pageable;

/**
 * Created by xinQing on 2016/12/2.
 */
public interface RoleService {

    /**
     * 分页查询所有记录
     *
     * @param pageable 分页信息
     * @return PageInfo<Role>
     */
    PageInfo<Role> getByPage(Pageable pageable);

    /**
     * 根据id获取角色
     *
     * @param id 角色id
     * @return 角色信息
     */
    Role getById(Integer id);
}
