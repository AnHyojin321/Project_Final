<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="kakao-add-channel-button" style="
    position: fixed; /* 화면에 고정 */
    bottom: 20px; /* 화면 하단에서 20px 위 */
    right: 20px; /* 화면 오른쪽에서 20px 안쪽 */
    z-index: 1000; /* 다른 요소 위에 표시 */
"></div>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    // 카카오 SDK 초기화
    Kakao.init('dc02060907b4ccb8c6417c5af8b8a228'); // 실제 JavaScript 키로 대체

    // 채팅 버튼 생성
Kakao.Channel.createAddChannelButton({
	  container: '#kakao-add-channel-button',
      channelPublicId: '_PPxdxln' // 채널 고유 ID로 대체
    });
  });
</script>


