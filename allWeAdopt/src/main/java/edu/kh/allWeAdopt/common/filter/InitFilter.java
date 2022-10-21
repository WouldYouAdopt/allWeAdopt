package edu.kh.allWeAdopt.common.filter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "initFilter", urlPatterns = "/*")
public class InitFilter extends HttpFilter implements Filter {
		
	// print구문 대신 Logger / Debug Mode 사용
	
	// Logger 객체 생성 - InitFilter.class에 대한 로그를 찍는 객체
	private final Logger logger = LoggerFactory.getLogger(InitFilter.class);
	
	// 필터 생성시 실행
    public void init(FilterConfig fConfig) throws ServletException {

    	logger.info("초기화 필터 생성");
	}  
    
    // 필터 파괴시 실행
	public void destroy() {
		logger.info("초기화 필터 파괴");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		// application 내장 객체 얻어오기
		ServletContext application = request.getServletContext();

		// 최상위 주소 얻어오기
		String contextPath =  ( (HttpServletRequest)request ).getContextPath();

		application.setAttribute("contextPath", contextPath);

		chain.doFilter(request, response);
	}

}