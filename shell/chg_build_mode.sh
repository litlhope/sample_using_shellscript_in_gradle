#!/bin/sh

# FIXME: 소스 경로(SRC_HOME) 등은 자신의 설정에 맞도록 수정합니다.
#
# Android Studio Gradle에서 소스의 BUILD_MODE를 수정하기 위한 용도록 작성한 스크립트 이므로 Usage 표시등의 기능은 제공하지 않습니다.
# 옵션은 r / t 를 사용합니다.
# Usage: chg_build_mode.sh r|t
#     r : Const 소스를 Release용으로 변경합니다.
#     t : Const 소스를 Test용으로 변경합니다.
#
# kr.hejairi.sample.shellscript.common.Const.class의 BUILD_MODE 상수의 값을 변경합니다.
#

# 설정
SRC_HOME=/Users/litlhope/AndroidStudioProjects/ShellScriptSample/app/src/main/java

# 변수
MODE=""

# Argument 파싱
while [ "$1" != "" ]; do
	PARAM=`echo $1 | awk -F= '{print $1}'`
	VALUE=`echo $1 | awk -F= '{print $2}'`
	case $PARAM in
		r)
			MODE="BuildMode.RELEASE"
		;;
		t)
			MODE="BuildMode.TEST"
		;;
		*)
			echo "ERROR: 알수없는 파라미터입니다. \"$PARAM\""
			exit 1
		;;
	esac
	shift
done

# 빌드모드 입력 여부 체크
if [ "$MODE" == "" ]; then
	echo "ERROR: 빌드모드는 r,t 중 반드시 한가지를 지정해 주세요. "
	exit 1
fi

cd $SRC_HOME
# 빌드 상수값을 변경한다.
sed -i -e "s/BUILD_MODE = BuildMode.[A-Z]*/BUILD_MODE = $MODE/" ./kr/hejairi/sample/shellscript/common/Const.java

# sed명령으로 생성된 백업파일을 삭제한다.
rm -Rf $(find ./ -name "*-e")

echo "=========="
echo "소스 변경부분 입니다. (kr/hejairi/sample/shellscript/common/Const.java)"
grep -n "BUILD_MODE = " kr/hejairi/sample/shellscript/common/Const.java
