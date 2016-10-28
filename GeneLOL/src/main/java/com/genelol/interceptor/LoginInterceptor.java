package com.genelol.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.genelol.vo.user.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");
		UserVO adminVO = (UserVO) userVO;

		System.out.println("post");

		if (userVO != null) {
			System.out.println("Log in Success");
			session.setAttribute(LOGIN, userVO);
			System.out.println(session.getAttribute("login").toString());
		}

		if (adminVO.getUserType().equals("member")) {
			Object dest = session.getAttribute("dest");
			response.sendRedirect(dest != null ? (String) dest : "/");
		} else if (adminVO.getUserType().equals("operator")) {
			response.sendRedirect("/adminpage");
		}

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		System.out.println("pre");
		if (session.getAttribute(LOGIN) != null) {
			System.out.println("User was already loged in!");
			response.sendRedirect("/");
			return false;
		}
		return true;
	}

}
