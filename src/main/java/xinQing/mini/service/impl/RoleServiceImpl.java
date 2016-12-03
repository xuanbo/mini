package xinQing.mini.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import xinQing.mini.dao.RoleDao;
import xinQing.mini.entity.Role;
import xinQing.mini.model.Pageable;
import xinQing.mini.service.RoleService;

/**
 * Created by xinQing on 2016/12/2.
 */
@Transactional
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    @Transactional(readOnly = true)
    public PageInfo<Role> getByPage(Pageable pageable) {
        PageHelper.startPage(pageable.getCurrent(), pageable.getSize(), pageable.getOrderBy());
        return new PageInfo<>(roleDao.selectAll());
    }

    @Override
    @Transactional(readOnly = true)
    public Role getById(Integer id) {
        return roleDao.getById(id);
    }
}
