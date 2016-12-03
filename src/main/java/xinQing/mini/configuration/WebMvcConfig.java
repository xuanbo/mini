package xinQing.mini.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * Spring Mvc配置
 *
 * Created by xuan on 16-12-1.
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "xinQing.mini.controller")
public class WebMvcConfig extends WebMvcConfigurerAdapter {

    public static final String CHARACTER_ENCODING = "UTF-8";

    /**
     * Jsp视图解析
     *
     * @return InternalResourceViewResolver
     */
    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");
        viewResolver.setViewClass(JstlView.class);
        return viewResolver;
    }

    /**
     * 静态资源
     *
     * @param registry ResourceHandlerRegistry
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("/static/");
    }
}
