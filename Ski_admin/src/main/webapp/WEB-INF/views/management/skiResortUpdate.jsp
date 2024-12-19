<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스키장 오픈 관리</title>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="iconSun" viewBox="0 0 24 24">
		<path d="M12 18C8.68629 18 6 15.3137 6 12C6 8.68629 8.68629 6 12 6C15.3137 6 18 8.68629 18 12C18 15.3137 15.3137 18 12 18ZM12 16C14.2091 16 16 14.2091 16 12C16 9.79086 14.2091 8 12 8C9.79086 8 8 9.79086 8 12C8 14.2091 9.79086 16 12 16ZM11 1H13V4H11V1ZM11 20H13V23H11V20ZM3.51472 4.92893L4.92893 3.51472L7.05025 5.63604L5.63604 7.05025L3.51472 4.92893ZM16.9497 18.364L18.364 16.9497L20.4853 19.0711L19.0711 20.4853L16.9497 18.364ZM19.0711 3.51472L20.4853 4.92893L18.364 7.05025L16.9497 5.63604L19.0711 3.51472ZM5.63604 16.9497L7.05025 18.364L4.92893 20.4853L3.51472 19.0711L5.63604 16.9497ZM23 11V13H20V11H23ZM4 11V13H1V11H4Z"></path>
    </symbol>
    <symbol id="iconSemiCloud" viewBox="0 0 24 24">
		<path d="M9.98392 5.05991C11.1323 3.22236 13.1734 2 15.5 2C19.0899 2 22 4.91015 22 8.5C22 9.58031 21.7365 10.5991 21.2701 11.4955C22.3351 12.4985 23 13.9216 23 15.5C23 18.5376 20.5376 21 17.5 21H9C4.58172 21 1 17.4183 1 13C1 8.58172 4.58172 5 9 5C9.33312 5 9.66149 5.02036 9.98392 5.05991ZM12.0554 5.60419C14.0675 6.43637 15.6662 8.06578 16.4576 10.0986C16.7951 10.0339 17.1436 10 17.5 10C18.2351 10 18.9366 10.1442 19.5776 10.4059C19.8486 9.82719 20 9.18128 20 8.5C20 6.01472 17.9853 4 15.5 4C14.1177 4 12.8809 4.6233 12.0554 5.60419ZM17.5 19C19.433 19 21 17.433 21 15.5C21 13.567 19.433 12 17.5 12C16.5205 12 15.6351 12.4023 14.9998 13.0507C14.9999 13.0338 15 13.0169 15 13C15 9.68629 12.3137 7 9 7C5.68629 7 3 9.68629 3 13C3 16.3137 5.68629 19 9 19H17.5Z"></path>
    </symbol>
    <symbol id="iconCloud" viewBox="0 0 24 24">
    	<path d="M12 2C15.866 2 19 5.13401 19 9C19 9.11351 18.9973 9.22639 18.992 9.33857C21.3265 10.16 23 12.3846 23 15C23 18.3137 20.3137 21 17 21H7C3.68629 21 1 18.3137 1 15C1 12.3846 2.67346 10.16 5.00804 9.33857C5.0027 9.22639 5 9.11351 5 9C5 5.13401 8.13401 2 12 2ZM12 4C9.23858 4 7 6.23858 7 9C7 9.08147 7.00193 9.16263 7.00578 9.24344L7.07662 10.7309L5.67183 11.2252C4.0844 11.7837 3 13.2889 3 15C3 17.2091 4.79086 19 7 19H17C19.2091 19 21 17.2091 21 15C21 12.79 19.21 11 17 11C15.233 11 13.7337 12.1457 13.2042 13.7347L11.3064 13.1021C12.1005 10.7185 14.35 9 17 9C17 6.23858 14.7614 4 12 4Z"></path>
    </symbol>
    <symbol id="iconSnow" viewBox="0 0 24 24">
    	<path d="M6 17.4185C3.06817 16.2317 1 13.3574 1 10C1 5.58172 4.58172 2 9 2C12.3949 2 15.2959 4.11466 16.4576 7.09864C16.7951 7.0339 17.1436 7 17.5 7C20.5376 7 23 9.46243 23 12.5C23 15.0176 21.3085 17.14 19 17.793V15.6632C20.1825 15.1015 21 13.8962 21 12.5C21 10.567 19.433 9 17.5 9C16.5205 9 15.6351 9.40232 14.9998 10.0507C14.9999 10.0338 15 10.0169 15 10C15 6.68629 12.3137 4 9 4C5.68629 4 3 6.68629 3 10C3 12.2208 4.2066 14.1599 6 15.1973V17.4185ZM10 17C8.89543 17 8 16.1046 8 15C8 13.8954 8.89543 13 10 13C11.1046 13 12 13.8954 12 15C12 16.1046 11.1046 17 10 17ZM15 20C13.8954 20 13 19.1046 13 18C13 16.8954 13.8954 16 15 16C16.1046 16 17 16.8954 17 18C17 19.1046 16.1046 20 15 20ZM10 23C8.89543 23 8 22.1046 8 21C8 19.8954 8.89543 19 10 19C11.1046 19 12 19.8954 12 21C12 22.1046 11.1046 23 10 23Z"></path>
    </symbol>
    <symbol id="iconRain" viewBox="0 0 24 24">
    	<path d="M5 16.9297C2.60879 15.5465 1 12.9611 1 10C1 5.58172 4.58172 2 9 2C12.3949 2 15.2959 4.11466 16.4576 7.09864C16.7951 7.0339 17.1436 7 17.5 7C20.5376 7 23 9.46243 23 12.5C23 15.0176 21.3085 17.14 19 17.793V15.6632C20.1825 15.1015 21 13.8962 21 12.5C21 10.567 19.433 9 17.5 9C16.5205 9 15.6351 9.40232 14.9998 10.0507C14.9999 10.0338 15 10.0169 15 10C15 6.68629 12.3137 4 9 4C5.68629 4 3 6.68629 3 10C3 11.777 3.7725 13.3736 5 14.4722V16.9297ZM7 16H9V20H7V16ZM15 16H17V20H15V16ZM11 19H13V23H11V19Z"></path>
    </symbol>
    <symbol id="iconMist" viewBox="0 0 24 24">
    	<path d="M4 4H8V6H4V4ZM16 19H20V21H16V19ZM2 9H7V11H2V9ZM9 9H12V11H9V9ZM14 9H20V11H14V9ZM4 14H10V16H4V14ZM12 14H15V16H12V14ZM17 14H22V16H17V14ZM10 4H22V6H10V4ZM2 19H14V21H2V19Z"></path>
    </symbol>
</svg>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style> 
	#outer {
		display:flex;
	}
	thead>tr>th {
	    width: 200px;
	}
	.openBtn {
	    width: 100%;
	    height: 40px;
	    background-color: rgb(194, 220, 255);
	    border: 0px;
	    cursor:pointer;
	}
	table {
	    border-spacing: 0px;
	    width:100%;
	}
	th {
	    padding: 0px;
	}
</style>
</head>
<body>     
	<div class="admin-container">
		<jsp:include page="../common/sidebar.jsp" />
		<div id="title">
	        <h1>스키장 오픈 관리</h1>
	    </div>
	    <div id="outer">
	       	<c:forEach var="sro" items="${ requestScope.list }">
	        	<table border="1px solid black">
	        		<tr><th colspan="2">${ sro.skiResortDate }</th></tr>
	        		<tr><th colspan="2">${ sro.skiResortDay }</th></tr>
	        		<tr>
	        			<th colspan="2">
		    <svg class="icon"><use xlink:href="#iconSun"></use></svg>
	        			</th>
	        		</tr>
	        		<tr>
		        		<th colspan="2">
		        			맑음
		        		</th>
		        	</tr>
	        		<tr>
		        		<th>
		        			최고
		        		</th>
		        		<th>
		        			최저
		        		</th>
		        	</tr>
	        		<tr>
		        		<th>
		        			3
		        		</th>
		        		<th>
		        			-3
		        		</th>
		        	</tr>
	        		<tr>
			            <th colspan="2">
			                <input 
							    type="button" 
							    class="openBtn" 
							    style="background-color: ${sro.skiResortIsOpen == 'Y' ? 'rgb(194, 220, 255)' : 'rgb(255, 194, 194)'};" 
							    onclick="toggleOpen(this, '${sro.skiResortDay}', '${sro.skiResortIsOpen}');" 
							    value="${ sro.skiResortIsOpen == 'Y' ? 'OPEN' : 'CLOSE'}" 
							    name="skiResortIsOpen"
							/>
			            </th>
			        </tr>
		        </table>
	       	</c:forEach>
	    </div>
	
	    <form action="skiResortUpdateControl.sm" id="skiResortForm" method="post">
		    <input type="hidden" id="skiResortDay" name="skiResortDay" />
		    <input type="hidden" id="skiResortIsOpen" name="skiResortIsOpen" />
		</form>
		
		<div>
		    <svg class="icon"><use xlink:href="#iconSemiCloud"></use></svg>
		    <svg class="icon"><use xlink:href="#iconSnow"></use></svg>
		    <svg class="icon"><use xlink:href="#iconRain"></use></svg>
		    <svg class="icon"><use xlink:href="#iconMist"></use></svg>
		</div>
	</div>

    <script>
    
	    function toggleOpen(button, skiResortDay, currentStatus) {
	        let message = '';
	        let newStatus = '';
	        
	        if (currentStatus === 'Y') {
	            message = '스키장을 닫으시겠습니까?';
	            newStatus = 'N'; // 상태를 CLOSE로 변경
	        } else {
	            message = '스키장을 여시겠습니까?';
	            newStatus = 'Y'; // 상태를 OPEN으로 변경
	        }
	
	        if (confirm(message)) {
	            document.getElementById('skiResortDay').value = skiResortDay;
	            document.getElementById('skiResortIsOpen').value = newStatus;
	            document.getElementById('skiResortForm').submit();
	        }
	    }
	    
	</script>

</body>
</html>