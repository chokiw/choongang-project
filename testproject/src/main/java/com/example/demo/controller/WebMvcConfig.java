package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	@Autowired
	private SessionCheckInter interceptor;	
	@Override   // 인터셉터가 동작할 url 패턴 등록
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
				.addPathPatterns("/mainpage")
				.addPathPatterns("/mypage")
				.addPathPatterns("/runnertrack")
				.addPathPatterns("/mywriting")
				.addPathPatterns("/liked_board")
				.addPathPatterns("/alarm_page")
				.addPathPatterns("/mate_board")
				.addPathPatterns("/mate_write")
				.addPathPatterns("/mate_detail")
				.addPathPatterns("/mate_update")
				.addPathPatterns("/sns_board")
				.addPathPatterns("/sns_detail")
				.addPathPatterns("/sns_update")
				.addPathPatterns("/sns_write")
				.addPathPatterns("/userpage")
				.addPathPatterns("/run")
				.addPathPatterns("/logout1");
	}
}
