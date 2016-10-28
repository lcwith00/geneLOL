package com.genelol.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.genelol.vo.user.UserVO;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = Logger.getLogger(AuthInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession httpSession = request.getSession();

		if (httpSession.getAttribute("login") == null) {
			logger.info("current user is not logined");

			saveDest(request);

			response.sendRedirect("/user/loginpage");
			return false;
		} else if (((UserVO) httpSession.getAttribute("login")).getUserType().equals("member")
				&& request.getRequestURI().equals("/adminpage")) {
			response.sendRedirect("/");
		}
		return true;
	}

	private void saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI();

		String query = req.getQueryString();

		if (query == null || query.equals(null)) {
			query = "";
		} else {
			query = "?" + query;
		}

		if (req.getMethod().equals("GET")) {
			logger.info("dest:" + (uri + query));
			req.getSession().setAttribute("dest", uri + query);
		}
	}
}
