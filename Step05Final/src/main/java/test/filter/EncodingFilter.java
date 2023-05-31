package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/*
 * 여청을 중간에 가로채서 encoding 설정을 해주는 filter 만들기
 */
@WebFilter("/*") //"/*"는 이 프로젝트에 오는 모든 요청에 대해 필터링 하겠다는 의미
public class EncodingFilter implements Filter {

	@Override
	public void destroy() {
	
	}
	//필터가 동작할때 호출되는 메소드
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if(request.getCharacterEncoding()==null){
			request.setCharacterEncoding("utf-8");
		}
		chain.doFilter(request, response);//호출하지 않으면 진행이 안된다
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
