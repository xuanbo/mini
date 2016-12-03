package xinQing.mini.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xinQing.mini.dao.UserDao;
import xinQing.mini.entity.User;
import xinQing.mini.model.Pageable;
import xinQing.mini.service.UserService;

import java.util.List;

/**
 * Created by xuan on 16-12-1.
 */
@Transactional
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    @Qualifier("passwordEncoder")
    private PasswordEncoder passwordEncoder;

    @Override
    @Transactional(readOnly = true)
    public List<User> selectAll() {
        return userDao.selectAll(null);
    }

    @Override
    @Transactional(readOnly = true)
    public PageInfo<User> getByPage(User user, Pageable pageable) {
        PageHelper.startPage(pageable.getCurrent(), pageable.getSize(), pageable.getOrderBy());
        return new PageInfo<>(userDao.selectAll(user));
    }

    @Override
    @Transactional
    public int update(User user) {
        return userDao.updateNotNullById(user);
    }

    @Override
    @Transactional
    public int insert(User user) {
        // 密码加密
        String encodePassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodePassword);
        return userDao.insert(user);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean usernameIsAvailable(String username) {
        User user = userDao.getByUsername(username);
        return user == null;
    }
}
