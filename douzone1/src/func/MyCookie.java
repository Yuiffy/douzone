package func;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class MyCookie {
	public static String GetC(String name) {
		HttpServletRequest request = ServletActionContext.getRequest();
		Cookie[] cookies = request.getCookies();
		for (javax.servlet.http.Cookie cookie : cookies) {
			if (cookie.getName().equals(name)) {
				try {
					return URLDecoder.decode(cookie.getValue(), "UTF-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("MyCookie.GetC Error");
					return null;
				}
			}
		}
		return null;
	}

	public static boolean AddC(String name, String value, int maxAge) {
		Cookie cookie;
		try {
			cookie = new Cookie(name, URLEncoder.encode(value, "UTF-8"));
			cookie.setMaxAge(maxAge);
			ServletActionContext.getResponse().addCookie(cookie);
			return true;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("MyCookie.AddC Error");
			return false;
		}
	}

	public static boolean AddC(String name, String value) {
		return AddC(name, value, 60 * 60 * 24 * 365);
	}
}
