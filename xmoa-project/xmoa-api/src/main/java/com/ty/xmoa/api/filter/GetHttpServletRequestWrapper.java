package com.ty.xmoa.api.filter;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class GetHttpServletRequestWrapper extends HttpServletRequestWrapper {

	private String charset = "UTF-8";

	private static final String ENCODED = "__encoded";

	private Map<String, String> urlParamNames = null;

	/**
	 * @param request
	 */
	public GetHttpServletRequestWrapper(HttpServletRequest request) {
		super(request);
		initUrlParameterNames();
	}

	/**
	 * 获得被装饰对象的引用和采用的字符编码
	 * 
	 * @param request
	 * @param charset
	 */
	public GetHttpServletRequestWrapper(HttpServletRequest request, String charset) {
		super(request);
		this.charset = charset;
		initUrlParameterNames();
	}

	@Override
	public Enumeration<String> getParameterNames() {
		return super.getParameterNames();
	}

	/**
	 * 实际上就是调用被包装的请求对象的getParameter方法获得参数，然后再进行编码转换
	 */
	@Override
	public String getParameter(String name) {
		String value = super.getParameter(name);
		// 根据urlParamNames是否包含此值来判断是否需要对其进行get方式转码
		if (!urlParamNames.containsKey(name)) {
			return value;
		}
		if (null != value) {
			value = convert(value);
		}
		return value;
	}

	@Override
	public String[] getParameterValues(String name) {
		// values也是传值
		String[] values = super.getParameterValues(name);
		if ((!urlParamNames.containsKey(name))) {
			return values;
		}
		for (int i = 0; i < values.length; i++) {
			values[i] = convert(values[i]);
		}

		return values;
	}

	@Override
	public Map<String, String[]> getParameterMap() {
		Map<String, String[]> map = super.getParameterMap();
		// 是否已经转码的标识位
		// 因为map是传引用的，因此多次调用时，原值会被转码转码在转码，因此要设置此标志位，防止多次转码
		if ("1".equals(this.getAttribute(ENCODED))) {
			return map;
		}

		// 对map中所有的url传参进行编码
		// 遍历map中的参数，转换器编码
		for (String key : urlParamNames.keySet()) {
			String[] value = map.get(key);
			if (value != null) {
				for (int i = 0; i < value.length; i++) {
					value[i] = convert(value[i]);
				}
			}
		}

		this.setAttribute(ENCODED, "1");
		return map;
	}

	/**
	 * 将字符串转码 ISO-8859-1为国际通用url编码
	 * 
	 * @param target
	 * @return
	 */
	private String convert(String target) {
		try {
			return new String(target.trim().getBytes("ISO-8859-1"), charset);
		} catch (UnsupportedEncodingException e) {
			return target;
		}
	}

	/**
	 * 初始化设置url传值的参数名
	 */
	private void initUrlParameterNames() {
		if (null != urlParamNames) {
			return;
		}
		// 获取所有的url传参的参数名
		urlParamNames = new HashMap<String, String>();
		String st = this.getQueryString();
		if (null == st || 0 == st.length()) {
			return;
		}
		String[] params = this.getQueryString().split("&");
		for (String p : params) {
			if (!p.contains("=")) {
				continue;
			}
			urlParamNames.put(p.substring(0, p.indexOf("=")), null);
		}
	}

}