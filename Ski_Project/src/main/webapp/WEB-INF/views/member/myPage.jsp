<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
  <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>마이페이지</h2>
            <br>

			<!-- 
				action 속성을 작성하지 않고
				submit 버튼을 그냥 클릭하게 되면 현재 요청 url 로
				다시 요청이 들어가게 됨!!
				> 우리는 이미 마이페이지를 띄워줄 수 있는 myPage.me 요청을
				  GET 방식으로 메소드를 정의해놨었음!!
				> 이 경우 지금 myPage.me 로 POST 방식으로 요청이 들어가기 때문에
				  405 Error 발생!! (GET <-> POST 요청이 안맞을 때 발생)
				  
				내 정보 수정 요청 시
				http://localhost:8006/spring/update.me    
			-->
            <form action="update.me" method="post">
                <div class="form-group">
                    <label for="memberId">* ID : </label>
                    <input type="text" class="form-control" id="memberId" value="${ sessionScope.loginMember.memberId }" name="memberId" readonly> <br>

                    <label for="mebmerName">* Name : </label>
                    <input type="text" class="form-control" id="memberName" value="${ sessionScope.loginMember.memberName }" name="memberName" required> <br>

                    <label for="email"> &nbsp; Email : </label>
                    <input type="text" class="form-control" id="email" value="${ sessionScope.loginMember.email }" name="email"> <br>

                    <label for="birthDate"> &nbsp; BirthDate : </label>
                    <input type="date" class="form-control" id="birthDate" value="${ sessionScope.loginMember.birthDate }" name="birthDate"> <br>

                    <label for="phone"> &nbsp; Phone : </label>
                    <input type="tel" class="form-control" id="phone" value="${ sessionScope.loginMember.phone }" name="phone"> <br>
                    
                    <label for="address"> &nbsp; Address : </label>
                    <input type="text" class="form-control" id="address" value="${ sessionScope.loginMember.address }" name="address"> <br>
                    
                    
             
                    
                </div> 
                <br>
                <div class="btns" align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                </div>
            </form>
        </div>
        <br><br>
        
    </div>

    <!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
<div class="modal fade" id="deleteForm" tabindex="-1" role="dialog" aria-labelledby="deleteFormLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title" id="deleteFormLabel">회원탈퇴</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- Modal Body -->
            <form action="delete.me" method="post">
                <div class="modal-body">
                    <p>탈퇴 후 복구가 불가능합니다. 정말로 탈퇴 하시겠습니까?</p>
                    <label for="memberPwd">Password:</label>
                    <input type="password" class="form-control" id="memberPwd" name="memberPwd" required>
                    <input type="hidden" name="memberId" value="${sessionScope.loginMember.memberId}">
                </div>
                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">탈퇴하기</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>