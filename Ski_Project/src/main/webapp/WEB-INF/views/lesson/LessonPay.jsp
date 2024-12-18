<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강습요금 안내</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            line-height: 1.5;
            color: #333;
            padding: 20px;
                background-color: white !important; /* 흰색 강제 적용 */
        }


        .container {
            max-width: 1000px;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
            font-size: 32px;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
        }

        .notice {
            background: #f8f9fa;
            padding: 20px;
            margin-bottom: 30px;
        }

        .notice p {
            margin-bottom: 8px;
        }

        .notice .red {
            color: #ff0000;
        }

        .timetables {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
        }

        .timetable {
            flex: 1;
        }

        .timetable h3 {
            margin-bottom: 15px;
            color: #0066cc;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background: #f8f9fa;
        }

        .step {
            margin-bottom: 30px;
        }

        .step-header {
            background: #4a90e2;
            color: white;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .price-note {
            color: #ff0000;
            margin-top: 10px;
        }

        .footnote {
            color: #666;
            font-size: 0.9em;
            text-align: right;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="container">
        <h1>강습요금 안내</h1>
        <p class="subtitle">설레눈 리조트 스키 아카데미의 강습요금은 다음과 같습니다.</p>

        <div class="notice">
            <p>• 설레눈 리조트 스키 아카데미에서는 초급 1:3 강습을 진행합니다.</p>
            <p>• 정규 강습은 2시간을 기준으로 하나 수강생 건강 진단에 따라 2시간 이내 여유롭게 진행됩니다.</p>
        </div>

        <div class="timetables">
            <div class="timetable">
                <h3>2시간코스 시간표 안내</h3>
                <table>
                    <tr>
                        <th>교시</th>
                        <th>코스</th>
                        <th>강습시간</th>
                    </tr>
                    <tr>
                        <td>1교시</td>
                        <td>2시간</td>
                        <td>08:30 ~ 10:30</td>
                    </tr>
                    <tr>
                        <td>2교시</td>
                        <td>2시간</td>
                        <td>10:30 ~ 12:30</td>
                    </tr>
                    <tr>
                        <td>점심시간</td>
                        <td>1시간</td>
                        <td>12:30 ~ 13:30</td>
                    </tr>
                    <tr>
                        <td>3교시</td>
                        <td>2시간</td>
                        <td>13:30 ~ 15:30</td>
                    </tr>
                    <tr>
                        <td>4교시</td>
                        <td>2시간</td>
                        <td>15:30 ~ 17:30</td>
                    </tr>
                </table>
            </div>

            <div class="timetable">
                <h3>4시간코스 시간표 안내</h3>
                <table>
                    <tr>
                        <th>교시</th>
                        <th>코스</th>
                        <th>강습시간</th>
                    </tr>
                    <tr>
                        <td>1교시</td>
                        <td>4시간</td>
                        <td>08:30 ~ 12:30</td>
                    </tr>
                    <tr>
                        <td>점심시간</td>
                        <td>1시간</td>
                        <td>12:30 ~ 13:30</td>
                    </tr>
                    <tr>
                        <td>2교시</td>
                        <td>4시간</td>
                        <td>13:30 ~ 17:30</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="step">
            <div class="step-header">
                스텝1 (2시간기준제) 스키 아카데미 기초(베이직) 강습안내
            </div>
            <table>
                <tr>
                    <th>강습인원</th>
                    <th>강습요금</th>
                </tr>
                <tr>
                    <td>1:1 개인강습</td>
                    <td>14만원(1인당 140,000)</td>
                </tr>
                <tr>
                    <td>1:2 소그룹 강습</td>
                    <td>20만원(1인당 100,000)</td>
                </tr>
                <tr>
                    <td>1:3 소그룹 강습</td>
                    <td>24만원(1인당 80,000)</td>
                </tr>
            </table>
            <p class="footnote">*강습하기전 표보험 (연당 관련)</p>
        </div>

        <div class="step">
            <div class="step-header">
                스텝2 (2시간기준제) 스키 아카데미 중 · 상급 강습 가격안내
            </div>
            <table>
                <tr>
                    <th>강습인원</th>
                    <th>강습요금</th>
                </tr>
                <tr>
                    <td>1:1 개인강습</td>
                    <td>18만원(1인당180,000)</td>
                </tr>
                <tr>
                    <td>1:2 소그룹 강습</td>
                    <td>24만원(1인당120,000)</td>
                </tr>
                <tr>
                    <td>1:3 소그룹 강습</td>
                    <td>30만원(1인당 100,000)</td>
                </tr>
            </table>
            <p class="footnote">*강습하기전 표보험 (연당 관련)</p>
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>