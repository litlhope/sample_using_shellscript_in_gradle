package kr.hejairi.sample.shellscript.common;

/**
 * 서버 정보를 담고 있는 상수 클래스.
 * Created by litlhope on 2014. 8. 7..
 */
// FIXME: 자신의 상황에 맞도록 아래 상수 정보들을 수정한다.
public class Const {
	private enum BuildMode {RELEASE, TEST};

	public static final BuildMode BUILD_MODE;

	public static final String API_BASE_URL;
	public static final int API_PORT;

	static {
		BUILD_MODE = BuildMode.TEST;

		switch (BUILD_MODE) {
			case RELEASE:
				API_BASE_URL = "https://api.server.kr";
				API_PORT = 8443;
				break;

			default:
				API_BASE_URL = "http://localhost";
				API_PORT = 8080;
				break;
		}
	}

	public static final String API_URL = API_BASE_URL + ":" + API_PORT + "/shell_sample";
}
