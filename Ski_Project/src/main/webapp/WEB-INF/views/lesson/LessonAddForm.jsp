<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강습예약</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            line-height: 1.5;
            color: #333;
        }

        .form-container {
            max-width: 1000px;
            margin: 20px auto;
            background: #fff;
        }

        h1 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: normal;
        }

        .notification-banner {
            background: #f5f5f5;
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
            align-items: flex-start;
            gap: 15px;
        }

        .icon-group {
            display: flex;
            gap: 5px;
        }

        .icon {
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .privacy-policy {
            background: #f5f5f5;
            padding: 20px;
            margin-bottom: 20px;
        }

        .privacy-policy-content {
            margin-bottom: 15px;
        }

        .form-row {
            display: flex;
            border: 1px solid #e0e0e0;
            border-bottom: none;
        }

        .form-row:last-child {
            border-bottom: 1px solid #e0e0e0;
        }

        .form-label {
            width: 200px;
            padding: 15px;
            background: #f9f9f9;
            display: flex;
            align-items: center;
        }

        .form-label.required::before {
            content: "•";
            color: #ff6b01;
            margin-right: 5px;
        }

        .form-input {
            flex: 1;
            padding: 10px;
            background: #fff;
        }

        input[type="text"],
        input[type="email"],
        select,
        textarea {
            width: 100%;
            max-width: 300px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            background: #f9f9f9;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            padding: 5px 0;
        }

        .radio-group label {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        textarea {
            width: 100%;
            min-height: 150px;
            resize: vertical;
        }

        .note {
            margin-top: 10px;
            color: #666;
            font-size: 0.9em;
        }

        .agreement {
            padding: 10px;
            margin-bottom: 20px;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }

        .button-group button {
            padding: 8px 30px;
            border: 1px solid #ddd;
            background: #fff;
            cursor: pointer;
        }

        .red-text {
            color: #ff0000;
        }
        img {
		    max-width: 55px; 
		    height: 55px; 
		}
	        .privacy-policy-container {
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 10px;
    margin: 20px auto;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 14px;
    line-height: 1.6;
    max-width: 600px;
    background-color: #f9f9f9;
}

.privacy-policy-header {
    font-weight: bold;
    font-size: 16px;
    margin-bottom: 10px;
    text-align: center;
}

.privacy-policy-content {
    height: 150px; /* 스크롤 높이 설정 */
    overflow-y: auto; /* 세로 스크롤 */
    border: 1px solid #ccc;
    padding: 10px;
    background-color: #fff;
    border-radius: 5px;
    line-height: 1.6;
    color: #333;
}

.privacy-policy-footer {
    margin-top: 10px;
    text-align: center;
}

input[type="checkbox"] {
    margin-right: 5px;
}
	        	
    </style>
</head>
<body>
    <!--<jsp:include page="../common/header.jsp" />-->
    <div class="form-container">
        <h1>강습예약</h1>

        <div class="notification-banner">
            <div class="icon-group">
				<img src="resources/images/checkbox.png">
            </div>
            <div>
                <p>• 온라인 예약시 전액입금을 원칙으로 합니다.</p>
                <p>• 온라인 예약후 12시간동안 입금확인이 되지 않은 경우 자동 취소 됩니다.</p>
                <p>• 의류, 고글, 장갑등 개인 장비이므로 지정판매샵에서 현장 및 구매하시면 됩니다.</p>
                <p class="red-text">※ 예약변경은 최소3일전 가능하며 온라인 예약상금 중복은 불가능합니다.</p>
            </div>
        </div>

       <div class="privacy-policy-container">
            <div class="privacy-policy-header">
                <strong>개인정보처리방침</strong>
            </div>
            <div class="privacy-policy-content">
                설레눈 리조트(이하 '회사')는 원활한 강습예약을 위하여 아래와 같은 개인정보를 수집하고 있습니다.<br><br>
        
                <strong>수집하는 개인정보 항목</strong><br>
                - 강습예약: 이름, 비밀번호, 이메일, 휴대전화, 접속 IP, 쿠키데이터<br>
                - 기타 게시판: 이름, 비밀번호, 접속 IP, 쿠키데이터<br><br>
        
                <strong>개인정보의 수집 및 이용목적</strong><br>
                - 개인 식별 및 신청 서비스 제공<br><br>
        
                <strong>개인정보의 보유 및 이용기간</strong><br>
                - 이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.<br>
                - 다만, 원활한 서비스의 제공을 위해 서비스 완료 후 내용을 3개월간 보유할 수 있으며<br>
                  전자상거래에서의 소비자 보호에 관한 법률 등 타 법률에 의해 보존할 필요가 있는 경우에는 일정 기간 보존합니다.<br><br>
        
                ※ 고객님은 개인정보 수집 동의에 거부할 수 있습니다. 단, 거부 시 강습예약 신청이 불가능합니다.
            </div>
            <div class="privacy-policy-footer">
                <label>
                    <input type="checkbox" name="privacy-agreement" required>
                    개인정보처리방침에 동의합니다.
                </label>
            </div>
        </div>	


        <form id="addLessonForm" method="post" action="insert.le">
            <input type="hidden" name="memberNo" value="${loginMember.memberNo}">
            <input type="hidden" name="lessonTitle" value="${loginMember.memberName} 예약안내">
            
            <div class="form-row">
                <div class="form-label required">예약자</div>
                <div class="form-input">
                    <input type="text" value="${loginMember.memberName}" readonly>
                    <input type="hidden" name="memberName" value="${loginMember.memberName}">
                </div>
            </div>

            <div class="form-row">
                <div class="form-label">이메일</div>
                <div class="form-input">
                    <input type="email" name="email" value="${loginMember.email}">
                </div>
            </div>

            <div class="form-row">
                <div class="form-label required">휴대전화번호</div>
                <div class="form-input">
                    <div class="phone-group">
                        <input type="text" name="lessonPhone" id="lessonPhone" style="width: 350px">
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-label required">강습성격</div>
                <div class="form-input">
                    <div class="radio-group">
                        <label>
                            <input type="radio" name="lessonActivite" value="스키"> 스키
                        </label>
                        <label>
                            <input type="radio" name="lessonActivite" value="보드"> 보드
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-label required">희망일</div>
                <div class="form-input">
                    <div class="date-group">
                        <input type="date" style="width: 120px" id="lessonDate" name="lessonDate">
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-label required">강습프로그램</div>
                <div class="form-input">
                    <div class="radio-group">
                        <label>
                            <input type="radio" id="lessonType" name="lessonType" value="초급반" ${les.lessonType == '초급반' ? 'checked' : ''}> 초급반
                        </label>
                        <label>
                            <input type="radio" id="lessonType" name="lessonType" value="중급반" ${les.lessonType == '중급반' ? 'checked' : ''}> 중급반
                        </label>
                        <label>
                            <input type="radio" id="lessonType" name="lessonType" value="상급반" ${les.lessonType == '상급반' ? 'checked' : ''}> 상급반
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-label required">강습시간</div>
                <div class="form-input">
                    <select name="lessonTime" required>
                        <option value="">강습시간을 선택해주세요.</option>                        
                        <option value="2시간 - 1교시(08:30~10:30)">2시간 - 1교시(08:30~10:30)</option>
                        <option value="2시간 - 2교시(10:30~12:30)">2시간 - 2교시(10:30~12:30)</option>
                        <option value="2시간 - 3교시(13:30~15:30)">2시간 - 3교시(13:30~15:30)</option>
                        <option value="2시간 - 4교시(15:30~17:30)">2시간 - 4교시(15:30~17:30)</option>
                        <option value="4시간 - 1교시(08:30~12:30)">4시간 - 1교시(08:30~12:30)</option>
                        <option value="4시간 - 2교시(13:30~17:30)">4시간 - 2교시(13:30~17:30)</option>
                    </select>
                </div>
            </div>

            <div class="form-row">
                <div class="form-label required">예약인원</div>
                <div class="form-input">
                    <div class="radio-group">
                        <label>
                            <input type="radio" id="lessonResCount" name="lessonResCount" value="1:1 개인강습"> 1:1 개인강습
                        </label>
                        <label>
                            <input type="radio" id="lessonResCount" name="lessonResCount" value="1:2 소그룹강습"> 1:2 소그룹강습
                        </label>
                        <label>
                            <input type="radio" id="lessonResCount" name="lessonResCount" value="1:3 소그룹강습"> 1:3 소그룹강습
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-row">
                <div class="form-label required">내용</div>
                <div class="form-input">
                    <textarea name="lessonResContent" id="lessonResContent" placeholder="강습시 주의 및 요구사항"></textarea>
                    <div class="note">
                        * 예약하기 완료 후 예약 안내메일이 발송됩니다.<br>
                        * 접수 후 사용안내 이메일이 발송 됩니다.<br>
                        * 핸드폰번호는 반드시 등록 해주셔야 됩니다.
                    </div>
                </div>
            </div>
            
            <div class="button-group">
                <button type="submit">등록</button>
                <button type="button" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>
   <%-- <jsp:include page="../common/footer.jsp" />--%>
</body>
</html>