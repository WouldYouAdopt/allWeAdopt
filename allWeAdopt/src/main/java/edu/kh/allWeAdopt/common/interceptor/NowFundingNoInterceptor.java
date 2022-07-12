package edu.kh.allWeAdopt.common.interceptor;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.kh.allWeAdopt.funding.model.service.FundingService;

public class NowFundingNoInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(HandlerInterceptor.class); 
	
	@Autowired
	private FundingService service;
			
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// application scope에 현재 진행중인 펀딩 번호 세팅 
		ServletContext application = request.getServletContext();
		
		int nowFundingNo = service.selectNowFundingNo();
		application.setAttribute("nowFundingNo", nowFundingNo);
		
		logger.info("전처리 테스트 nowFundingNo : " + nowFundingNo);
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}


	
}
