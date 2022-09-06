package thanhlcpd04359.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import thanhlcpd04359.service.ProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class GloballInterceptor implements HandlerInterceptor {

    @Autowired
    ProductService productService;

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
        request.setAttribute("data", productService.findByCategoryId());
        request.setAttribute("data1", productService.findByCategoryId1());
        request.setAttribute("data2", productService.findByCategoryId2());
    }
}
