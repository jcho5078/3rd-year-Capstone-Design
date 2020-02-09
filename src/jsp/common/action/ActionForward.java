package jsp.common.action;

/**
 * 페이지 이동을 처리하기 위한 클래스
 */
public class ActionForward {
	
	private boolean isRedirect = false;
	private String nextPath = null; // 이동할 다음화면
	
	/**
	 * Redirect 사용여부, false이면 Forward 사용
	 * @return isRedirect
	 */
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getNextPath() {
		return nextPath;
	}
	public void setNextPath(String nextPath) {
		this.nextPath = nextPath;
	}
}
