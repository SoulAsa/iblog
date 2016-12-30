package ren.ayane.core.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ren.ayane.core.constant.Constant;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		String uri = request.getRequestURI();
		// 判断当前请求地址是否是登录的请求地址
		if (!uri.contains("sys/login_")) {
			// 访问前台页面
			if (uri.contains("iblog/web/")) {
				// 直接放行
				chain.doFilter(request, response);
			}
			// 非登录请求
			else if (request.getSession().getAttribute(Constant.ADMIN) != null) {
				// 说明已经登陆过
				chain.doFilter(request, response);
			} else {
				// 没有登录，跳转到登陆页面
				response.sendRedirect(request.getContextPath() + "/sys/login_toLoginUI.action");
			}
		} else {
			// 登录请求，直接放行
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
