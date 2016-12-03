package xinQing.mini.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import xinQing.mini.service.UserService;

/**
 * 返回页面
 *
 * Created by xinQing on 2016/12/2.
 */
@Controller
@RequestMapping("/core/page")
public class PageController {

    @Autowired
    private UserService userService;

    /**
     * user页面
     *
     * @return /WEB-INF/core/user/user.jsp
     */
    @RequestMapping(value = "/user/index", method = RequestMethod.GET)
    public String user() {
        return "core/user/user";
    }
}
