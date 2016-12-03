package xinQing.mini.dao;

import org.springframework.stereotype.Repository;
import xinQing.mini.entity.Role;

import java.util.List;

/**
 * RoleDao
 *
 * Created by xuan on 16-12-1.
 */
@Repository
public interface RoleDao {

    /**
     * 根据id查询角色
     *
     * @param id 角色id
     * @return 查询到的角色
     */
    Role getById(Integer id);

    /**
     * 查询所有
     *
     * @return 所有Role
     */
    List<Role> selectAll();
}
