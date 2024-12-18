<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

/* 메인 콘텐츠 */
.content {
    flex: 1;
    padding: 30px;
    background-color: #f8f9fa;
}

header h1 {
    font-size: 2.5em;
    color: #2c3e50;
    margin-bottom: 10px;
}

.welcome-msg {
    font-size: 1.2em;
    color: #6c757d;
}

/* 대시보드 카드 */
.dashboard-cards {
    display: flex;
    gap: 20px;
    margin: 20px 0;
}

.card {
    background-color: #fff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    flex: 1;
    transition: transform 0.2s, box-shadow 0.2s;
    text-align: center;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card h3 {
    margin: 0;
    font-size: 1.5em;
    color: #2c3e50;
}

.card p {
    margin: 10px 0 0;
    font-size: 24px;
    color: navy;
    font-weight: 700;
}

/* 테이블 */
.dashboard-tables table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.dashboard-tables th,
.dashboard-tables td {
    padding: 15px;
    text-align: left;
}

.dashboard-tables th {
    background-color: #2c3e50;
    color: white;
    font-size: 1em;
}

.dashboard-tables td {
    background-color: white;
    font-size: 0.95em;
    border-bottom: 1px solid #ddd;
}

.dashboard-tables tr:hover td {
    background-color: #f1f3f5;
}

/* 애니메이션 효과 */
.dashboard-cards, .dashboard-tables {
    animation: fadeIn 1s ease-in-out;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

</style>
</head>
<body>
	
	<div class="admin-container">
	
		<jsp:include page="common/sidebar.jsp" />
		
        <!-- 메인 콘텐츠 -->
        <main class="content">
            <header>
                <h1>관리자 대시보드</h1>
                <p class="welcome-msg">환영합니다, <strong>관리자님</strong>!</p>
            </header>
            <section class="dashboard-cards">
                <div class="card">
                    <h3>총 회원 수</h3>
                    <p>1,234명</p>
                </div>
                <div class="card">
                    <h3>오늘 예약</h3>
                    <p>45건</p>
                </div>
                <div class="card">
                    <h3>총 수익</h3>
                    <p>₩ 2,678</p>
                </div>
                <div class="card">
                    <h3>문의 대기</h3>
                    <p>5건</p>
                </div>
            </section>

            <section class="dashboard-tables">
                <h2>최근 예약</h2>
                <table>
                    <thead>
                        <tr>
                            <th>예약 번호</th>
                            <th>회원 이름</th>
                            <th>객실 번호</th>
                            <th>체크인 날짜</th>
                            <th>체크아웃 날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>R1234</td>
                            <td>김철수</td>
                            <td>101</td>
                            <td>2024-12-27</td>
                            <td>2024-12-28</td>
                        </tr>
                        <tr>
                            <td>R1235</td>
                            <td>이영희</td>
                            <td>102</td>
                            <td>2024-12-28</td>
                            <td>2024-12-29</td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>
</body>
</html>