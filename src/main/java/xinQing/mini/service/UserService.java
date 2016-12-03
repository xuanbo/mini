package xinQing.mini.service;

import com.github.pagehelper.PageInfo;
import org.springframework.security.access.prepost.PreAuthorize;
import xinQing.mini.entity.User;
import xinQing.mini.model.Pageable;

import java.util.List;

/**
 * Created by xuan on 16-12-1.
 */
public interface UserService {

    /**
     * 查询所有记录
     * 具有ROLE_ADMIN角色的用户才能访问
     *
     * @return  所有User
     */
    @PreAuthorize("hasRole('ADMIN')")
    List<User> selectAll();

    /**
     * 分页查询用户
     *
     * @param user  条件查询
     * @param pageable  分页信息
     * @return PageInfo<User>
     */
    PageInfo<User> getByPage(User user, Pageable pageable);

    /**
     * 更新用户
     *
     * @param user 用户信息
     * @return 影响数据库记录行数
     */
    int update(User user);

    /**
     * 新增用户
     *
     * @param user 用户信息
     * @return 影响数据库记录行数
     */
    int insert(User user);

    /**
     * 用户名是否可用
     *
     * @param username 用户名
     * @return 不存在返回true
     */
    boolean usernameIsAvailable(String username);
}
