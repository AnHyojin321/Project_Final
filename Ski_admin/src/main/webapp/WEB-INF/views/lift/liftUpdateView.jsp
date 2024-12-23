<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	thead>tr>th {
	    width: 200px;
	}
	.openBtn {
	    width: 100%;
	    height: 40px;
	    background-color: rgb(194, 220, 255);
	    border: 0px;
	    font-weight: bold;
	    cursor: pointer;
	}
	table {
	    border-spacing: 0px;
	    width: 100%;
	}
	th {
	    padding: 0px;
	}
	select {
	    display: none; 
	    width: 90%;
	    font-size: 13px;
	    background-color: #f5f5f5;
	    border: 1px solid #ccc;
	    padding: 8px 12px;
	    border-radius: 5px;
	    transition: border-color 0.3s, background-color 0.3s;
	}
	
	select:focus {
	    outline: none;
	    border-color: #666666;
	    background-color: #f5f5f5;
	}
	
	form>div {
	    width: 99%;
	    padding-top:10px;
	    text-align: right;
	}
	#editBtn {
	    width: 130px;
	    height: 40px;
	    background-color: rgb(194, 220, 255);
	    border: 1px solid gray;
	    border-radius: 5px;
	    font-weight: bold;
	    font-size: 15px;
	    transition: background-color 0.3s ease;
	}
	#editBtn:hover {
	    cursor: pointer;
	    background-color: rgb(139, 190, 255);
	}
	input[type="text"] {
		width:95%;
		height:95%;
		font-size:1em;
	}
	        /* 메인 콘텐츠 */
.content {
	flex:1;
	width:100%;
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

/* 테이블 */
.dashboard-tables table {
	width: 100%; 
    border-collapse: collapse;
    height:90%;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}


.dashboard-tables th,
.dashboard-tables td {
    padding: 15px;
    text-align: left;
    height:30px;
}

.dashboard-tables th {
    background-color: #2c3e50;
    color: white;
    font-size: 1em;
}

.dashboard-tables td {
    background-color: white;
    font-size: 0.9em;
    max-height: 30px;
    border-bottom: 1px solid #ddd;
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
       #submitDiv {
		    width: 100%;
		    display: flex;  
		    justify-content: flex-end;
		    padding:0px;
		}
		#submit {
            width: 130px;
            height: 50px;
            background-color: rgb(194, 220, 255);
            border: none;
            border-radius: 5px;
            font-weight: bold;
            font-size: 15px;
            transition: background-color 0.3s ease;
            margin:15px;
        }
        #submit:hover {
            cursor: pointer;
            background-color: rgb(139, 190, 255);
        }
        #selectTd {
        	padding:5px;
        }
</style>
</head>
<body>
	<div class="admin-container">
        <jsp:include page="../common/sidebar.jsp" />
        <main class="content">
            <header>
                <h1>리프트권 금액 관리</h1>
                <p class="welcome-msg">환영합니다, <strong>관리자님</strong>!</p>
            </header>
            <section class="dashboard-tables">
			    <div>
			    	<form action="updateLift.li" method="post">
				        <table border="1px solid black">
				            <thead>
				                <tr>
				                    <th>LiftNo</th>
				                    <th>Type</th>
				                    <th>Age</th>
				                    <th>Price</th>
				                </tr>
				                <c:forEach var="li" items="${requestScope.list}" varStatus="status">
								    <tr>
								        <td>
								            ${li.liftNo}
								            <input type="hidden" name="li[${status.index}].liftNo" value="${li.liftNo}" />
								        </td>
								        <td>
								            ${li.liftType}
								            <input type="hidden" name="li[${status.index}].liftType" value="${li.liftType}" />
								        </td>
								        <td>
								            ${li.liftAge}
								            <input type="hidden" name="li[${status.index}].liftAge" value="${li.liftAge}" />
								        </td>
								        <td>
								        	<input type="text" name="li[${status.index}].liftPrice" value="${li.liftPrice}" />
								        </td>
								    </tr>
								</c:forEach>
				            </thead>
				        </table>
				        <div id="submitDiv">
				        	<input type="submit" id="submit" value="저장하기">
				        </div>
			    	</form>
			    </div>
            </section>
        </main>
	</div>
</body>
</html>