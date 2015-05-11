package action;

import com.opensymphony.xwork2.ActionSupport;

import java.math.BigDecimal;

public class FirstAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 662984047704252710L;
	private String operand1;
	private String operand2;
	private boolean ok = true;

	public String execute() {
		try {
			BigDecimal t = new BigDecimal(getSum());
			if (ok == false)
				return "illegal";
			if (t.compareTo(BigDecimal.ZERO) >= 0) // 如果代码数和是非负整数，跳到positive.jsp页面
			{
				return "positive";
			} else // 如果代码数和是负整数，跳到negative.jsp页面
			{
				return "negative";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "illegal";
		}
	}

	public String getOperand1() {
		return operand1;
	}

	public void setOperand1(String operand1) {
		this.operand1 = operand1;
	}

	public String getOperand2() {
		return operand2;
	}

	public void setOperand2(String operand2) {
		this.operand2 = operand2;
	}

	public String getSum() {
		if(operand1==null || operand2==null) {ok=false;return "0";}
		try {
			return (new BigDecimal(operand1).add(new BigDecimal(operand2)))
					.toString(); // 计算两个整数的代数和
		} catch (NumberFormatException e) {
			ok = false;
			return "0";
		}
	}

}