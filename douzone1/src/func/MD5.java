package func;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
	private final static char[] mChar = "0123456789abcdef".toCharArray();

	public static byte[] eccrypt(String info) throws NoSuchAlgorithmException {
		// 根据MD5算法生成MessageDigest对象
		MessageDigest md5;
		md5 = MessageDigest.getInstance("MD5");
		byte[] srcBytes = info.getBytes();
		// 使用srcBytes更新摘要
		md5.update(srcBytes);
		// 完成哈希计算，得到result
		byte[] resultBytes = md5.digest();
		return resultBytes;
	}

	public static String getString(String info) {
		try {
			byte[] bytes = eccrypt(info);
			StringBuilder re = new StringBuilder();
			for (byte b : bytes) {
				re.append(mChar[(b & 0xF0) >> 4]);
				re.append(mChar[(b & 0x0F)]);
			}
			return re.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			System.out.println("func.MD5.eccrypt ERROR");
		}
		return "";
	}
}
