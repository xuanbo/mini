package xinQing.mini.controller;

import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import xinQing.mini.entity.User;
import xinQing.mini.model.Pageable;
import xinQing.mini.model.ServiceModel;
import xinQing.mini.service.UserService;

/**
 * Created by xuan on 16-12-1.
 */
@RestController
@RequestMapping("/core")
public class UserController {

    private static final Logger log = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    /**
     * 分页查询用户
     *
     * @param user  条件查询
     * @param pageable 分页信息
     * @return PageInfo<User>
     */
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public PageInfo<User> getByPage(User user, Pageable pageable) {
        log.debug(user);
        log.debug(pageable);
        return userService.getByPage(user, pageable);
    }

    /**
     * 更新
     *
     * @param user 用户
     * @return  ServiceModel
     */
    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public ServiceModel<?> insert(@RequestBody User user) {
        userService.insert(user);
        return new ServiceModel<>(true, user);
    }

    /**
     * 更新
     *
     * @param user 用户
     * @return  ServiceModel
     */
    @RequestMapping(value = "/user", method = RequestMethod.PUT)
    public ServiceModel<?> update(@RequestBody User user) {
        return new ServiceModel<>(true, userService.update(user));
    }

    /**
     * 用户名是否可用
     *
     * @param username 用户
     * @return {"valid": true/false}
     */
    @RequestMapping(value = "/user/usernameIsAvailable", method = RequestMethod.GET)
    public String usernameIsAvailable(String username) {
        boolean isAvailable = userService.usernameIsAvailable(username);
        return "{\"valid\": " + isAvailable +"}";
    }
}
