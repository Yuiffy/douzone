package func;

import java.util.List;

public class Dzone {
	public static boolean CheckLogin(String email, String password) {
		if (email == null || password == null || email.isEmpty()
				|| password.isEmpty()) {
			return false;
		}
		email.replaceAll(".*([';]+|(--)+).*", " ");
		password.replaceAll(".*([';]+|(--)+).*", " ");
		String s = "select uname,password from user where email='" + email
				+ "'";
		sql.AnyList any = new sql.AnyList(s);
		if (any.isEmpty()) {
			return false;
		}
		List<List<String>> li2 = any.getList2();
		if (!li2.get(1).get(1).equals(password)) {
			return false;
		}
		return true;
	}

	private final static String flt = "'|;|-|,";
	private final static String bec = "$y|$f|$j|$d";
	private final static String fil[] = flt.split("|");
	private final static String fil2[] = bec.split("|");

	public static String Diao(String s) {
		String re = s;
		for (int i = 0; i < fil.length; i++) {
			re.replace(fil[i], fil2[i]);
		}
		return re;
	}

	public static String UnDiao(String s) {
		String re = s;
		for (int i = 0; i < fil.length; i++) {
			re.replace(fil2[i], fil[i]);
		}
		return re;
	}
}
