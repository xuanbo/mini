package xinQing.mini.dao;

import org.springframework.stereotype.Repository;
import xinQing.mini.entity.User;

import java.util.List;

/**
 * UserDao
 *
 * Created by xuan on 16-12-1.
 */
@Repository
public interface UserDao {

    /**
     * 根据用户名获取用户
     *
     * @param username 用户名
     * @return 查询到的用户
     */
    User getByUsername(String username);

    /**
     * 更新用户信息
     * 如果属性不为空则更新
     *
     *
     * @param user　将要更新的用户信息,id必须赋值
     * @return 影响数据库行数
     */
    int updateNotNullById(User user);

    /**
     *
     * 更新用户的失败尝试次数
     * 失败数加一
     *
     * @param username　用户名
     * @return 影响数据库行数
     */
    int updateFailAttemptTimes(String username);

    /**
     * 重置用户的失败尝试次数
     *
     * @param username 用户名
     * @return 影响数据库行数
     */
    int resetFailAttemptTimes(String username);

    /**
     * 查询所有记录
     *
     * @param user 用户信息
     * @return  所有满足条件User
     */
    List<User> selectAll(User user);

    /**
     * 新增用户
     *
     * @param user 用户信息
     * @return 影响数据库记录行数
     */
    int insert(User user);
}
