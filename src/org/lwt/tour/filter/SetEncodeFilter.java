package org.lwt.tour.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class SetEncodeFilter implements Filter {

        /**
         * 本过滤器的配置信息
         */
        protected FilterConfig filterConfig = null;

        /**
         * 系统缺省的语言编码
         */
        protected String defaultencoding = null;

        /**
         * 初始化过滤器
         */
        public void init(FilterConfig filterConfig) throws ServletException {
                this.filterConfig = filterConfig;
                // 获取系统缺省语言编码
                this.defaultencoding = filterConfig.getInitParameter("defaultencoding");
        }

        /**
         * 过滤系统请求，设置请求的语言编码
         */
        public void doFilter(
                ServletRequest request,
                ServletResponse response,
                FilterChain chain)
                throws IOException, ServletException {
                //request.setCharacterEncoding(selectEncoding(request));
                request.setCharacterEncoding("GBK");
                chain.doFilter(request, response);
                
        }

        /**
         * 过滤器销毁
         */
        public void destroy() {
                this.defaultencoding = null;
                this.filterConfig = null;
        }

        /**
         * 选择这次过滤所使用的语言编码
         * @param request 本次servlet请求的用户request实例
         * @return 选择出的语言编码
         */
        protected String selectEncoding(ServletRequest request) {
                // 可以在这里加入从request中取得session并从session中获取用户所选择的encode
                // 也可以在这里加入从request取得用户客户端的encode来设置当前的语言编码
                return (this.defaultencoding);
        }
}
