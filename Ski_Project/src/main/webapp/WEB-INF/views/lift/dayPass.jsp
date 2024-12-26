<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>일일권</title>
<style>
    body {
        height: 100%;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
    }
    #outer {
        height: 900px;
        display: flex;
    }
    table {
        border-spacing: 0px;
        background-color: rgba(200, 200, 220, 0.05);
    }
    select {
        background-color: rgba(200, 200, 220, 0.15);
        cursor: pointer;
        border-radius: 3px;
    }
    select:hover {
        background-color: rgba(200, 200, 220, 0.4);
    }
    select option {
        background-color: rgba(200, 200, 220, 0.4);
    }

    #productInformation #priceInformation #purchaseInformation #submitInformation {
        width: 90%;
    }

    #productInformation table {
        border: 1px solid gray;
        width: 100%;
        border-radius: 5px;
        padding: 10px 20px;
    }
    #productInformation td {
        width: 250px;
        height: 20px;
        padding:5px;
    }

    #priceInformation table {
        width: 100%;
        border-radius: 5px;
        padding: 5px;
        border: 1px solid gray;
        border-radius: 5px;
    }
    #priceInformation th {
        width: 150px;
        height: 40px;
    }
    #priceInformation td {
        height: 35px;
        text-align: center;
        border-top: 1px solid gray;
    }

    #purchaseInformation div:first-of-type {
        display: flex;
    }
    
    #orderTable {
        border-top-left-radius: 5px;
        border-bottom-left-radius: 5px;
        border: 1px solid gray;
        padding: 10px;
        width: 30%;
    }
    #purchaseInformation th, #purchaseInformation td {
        padding: 10px 5px;
    }
    .pu  {
        border-bottom: 1px solid gray;
    }
    #purchaseInformation input[type="text"] {
        width: 20px;
        margin: 0px;
    }

    #submitInformation h2 {
        float: right;
        font-size: 25px;
    }
    #submit{
        width: 100%;
        height: 55px;
        cursor: pointer;
        background-color : rgba(0, 10, 50, 0.7);
        border : 3px solid rgba(0, 10, 50, 0.1);
        border-radius : 10px;
        font-size : 20px;
        font-weight : border;
        transition: background-color 0.3s ease; 
        color:white;
    }
    #submit:hover {
    	background-color : rgba(0, 10, 50, 0.9);
        color:white;
    }
    .liftDiv {
        width: 50%;
        height: 100%;
        position: relative;
        overflow: hidden;
        content: "";
        top: 0;
        left: 0;
        z-index: 1;
        pointer-events: none;
        background-color: rgba(0, 0, 0, 0.5);
    }
    img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        position: relative;
        z-index: 0;
    }
    .textOverlay {
        position: absolute;
        top: 70%;
        left: 55%;
        transform: translate(-10%, -40%);
        color: white;
        font-size: 3rem;
        font-weight: bold;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.7);
        z-index: 2;
    }
    .detail {
        font-size: 1.3rem;
    }
    a {
        text-decoration: none;
        color: inherit;
    }
    .purchaseDiv {
        display: flex;
        justify-content: center;  /* Center horizontally */
        align-items: center;      /* Center vertically */
        width: 50%;
        height: 100%;
    }
    #orderView {
        display: flex; /* 올바른 flexbox 값 */
        flex-direction: column; /* 자식 요소를 세로로 정렬 */
        width: 70%;
        height: 110px; /* 높이 제한 */
        overflow-y: auto; /* 세로 스크롤 활성화 */
        border: 1px solid gray; /* 테두리 */
        border-top-right-radius: 5px;
        border-bottom-right-radius: 5px;
        padding: 10px; /* 내부 여백 */
        box-sizing: border-box; /* 패딩 포함 */
        background-color: rgba(200, 200, 220, 0.1);

    }
        /* 스크롤바 스타일링 */
    #orderView::-webkit-scrollbar {
        width: 6px; /* 스크롤바의 너비 */
    }

    #orderView::-webkit-scrollbar-track {
        background: transparent; /* 스크롤바 트랙(배경) */
    }

    #orderView::-webkit-scrollbar-thumb {
        background: rgba(0, 10, 50, 0.15); /* 스크롤바 색상 */
        border-radius: 10px; /* 둥근 모서리 */
    }

    #orderView::-webkit-scrollbar-thumb:hover {
        background: rgba(0, 10, 50, 0.25); /* 스크롤바 색상 (호버 시) */
    }

    #orderView table:first-child {
        margin: auto; /* 첫 번째 테이블만 가운데 정렬 */
    }

    #orderView table:not(:first-of-type) {
        border-top : 1px solid lightgray;
    }
    #orderView table td{
    	padding : 15px 5px;
    }
    select {
        width: 100%;
        height: 100%;
    }
    h3 {
        margin: 0px;
        padding: 10px;
    }

    #quantityTd {
		border: 1px solid lightgray;
		border-radius : 5px;
		padding:0px;
		margin:0px;
		height: 100%;
		width:100px;
		
	}
	#quantity {
		width:35%;
		height:100%;
		margin-left : 15px;
	}
	      #countBtn1 {
	   	width: 25%;
		height : 25px;
        border-radius: 5px;
	   	border : none;
	       cursor: pointer;
	       margin:0px;
           margin-left:5px;
           margin-right: 5px;
	       padding : 0px;
           background-color: rgba(0, 10, 50, 0.1);
	   }
	   #countBtn2 {
	   	width: 25%;
		height : 25px;
        border-radius: 5px;
	   	border : none;
	       cursor: pointer;
	       margin:0px;
	       padding : 0px;
           margin-left: 5px;
           background-color: rgba(0, 10, 50, 0.1);
	   }	
       span {
        padding-left: 8px; 
        padding-right:8px;
       }
	   .deleteBtn {
	   	width: 26px;
	   	height: 25px;
	       border-radius: 5px;
	       border: none;
	       background-color: rgba(0,10, 50, 0.1);
	       cursor: pointer;
           border: none;
	   }
	   #addItem {
	   	width: 10%;
	   	font-size: 11px;
	   	cursor: pointer;
	   	background-color : rgba(0, 10, 50, 0.1);
	   	border : 1px solid gray;
	   	border-left : none;
	   	border-right : none;
           transition: background-color 0.2s ease; 
	   }
	   
	   #addItem:hover {
	   	background-color: rgba(0, 10, 50, 0.13);
	   }

        #otherLiftBtn {
            cursor: pointer;
            border: none;
            background-color : rgba(0, 10, 50, 0.7);
            border-radius: 10px;
            color:white;
            padding:12px;
            transition: background-color 0.3s ease; 
        }
        #otherLiftBtn:hover {
            background-color : rgba(0, 10, 50, 0.8);
        }
    
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
     <div id="outer">
        <div class="liftDiv">
            <span class="textOverlay">
                24/25 <br>DAY PASS <br>
                <span class="detail">
                    Morning Pass (09:00-14:00)<br>
                    Afternoon Pass (16:00-21:00)<br>
                    Full-Day Pass  (09:00-21:00)<br>
                    Grooming Time (14:00-16:00)<br>
                </span>
            </span>
            <img src="resources/images/liftImage1.jpg"> 
        </div>
        <div class="purchaseDiv">
		    <div>
		        <div style="display:flex; gap:300px;">
		            <h1>24&nbsp;/&nbsp;25&nbsp;&nbsp;일일권</h1>
		            <div style="flex:right; margin:auto;">
		                <a href="seasonPass.li">
		                    <input type="button" value="시즌권 구매하기" id="otherLiftBtn"/>
		                </a>                    
		            </div>
		        </div> 
		        <br>
		        <div id="productInformation">
		            <h3>상품 정보</h3>
		            <table>
		                <tr>
		                    <td>당일부터 사용 가능</td>
		                    <td>유효기간 : ~ 폐장일까지</td>
		                </tr>
		                <tr>
		                    <td>환불 가능</td>
		                    <td>대인 : 만 13세 이상</td>
		                </tr>
		            </table>
		        </div>
		        <br>
		        <div id="priceInformation">
		            <h3>이용료</h3>
		            <table>
		                <thead>
		                    <tr>
		                        <th>리프트권</th>
		                        <th>시간</th>
		                        <th>연령대</th>
		                        <th>가격</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <tr>
		                        <td>오전권</td>
		                        <td>09:00-14:00</td>
		                        <td>대인</td>
		                        <td>
		                        	${dayPass[0].liftPrice}
		                    		<input type="hidden" value="${dayPass[0].liftNo}"/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td>오전권</td>
		                        <td>09:00-14:00</td>
		                        <td>소인</td>
		                        <td>
		                        	${dayPass[1].liftPrice}
		                    		<input type="hidden" value="${dayPass[1].liftNo}"/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td>오후권</td>
		                        <td>16:00-21:00</td>
		                        <td>대인</td>
		                        <td>	
			                        ${dayPass[2].liftPrice}
			                    	<input type="hidden" value="${dayPass[1].liftNo}"/>
		                    	</td>
		                    </tr>
		                    <tr>
		                        <td>오후권</td>
		                        <td>16:00-21:00</td>
		                        <td>소인</td>
		                        <td>
			                        ${dayPass[3].liftPrice}
			                    	<input type="hidden" value="${dayPass[3].liftNo}">
		                    	</td>
		                    </tr>
		                    <tr>
		                        <td>종일권</td>
		                        <td>09:00-21:00</td>
		                        <td>대인</td>
		                        <td>
			                        ${dayPass[4].liftPrice}
			                    	<input type="hidden" value="${dayPass[4].liftNo}"/>
		                    	</td>
		                    </tr>
		                    <tr>
		                        <td>종일권</td>
		                        <td>09:00-21:00</td>
		                        <td>소인</td>
		                        <td>
		                        	${dayPass[5].liftPrice}
		                    		<input type="hidden" value="${dayPass[5].liftNo}"/>
		                    	</td>
		                    </tr>
		                </tbody>
		            </table>
		        </div>
		        <br>
		        <div id="purchaseInformation">
	                <h3>구매하기</h3>
	                <div>
	                    <table id="orderTable">
	                        <tr>
	                            <th class="pu">종류</th>
	                            <td class="pu">
	                                <select name="liftType"  id="liftType" required>
									    <option disabled selected>종류</option>
									    <option value="오전권">오전권</option>
										<option value="오후권">오후권</option>
										<option value="종일권">종일권</option>
									</select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>연령대</th>
	                            <td>
	                                <select id="liftAge" autocomplete="off">
									    <option disabled selected>연령대</option>
									    <option value="대인">대인</option>
									    <option value="소인">소인</option>
									</select>
	                            </td>
	                        </tr>
	                    </table>
	                    <button type="button" id="addItem">추가하기</button>
	                    <div id="orderView">
	                        <table>
	                            <tbody id="orderList"></tbody>
	                        </table>
	                    </div>
	                </div>
	                <br>
	                <div id="submitInformation">
	                    <h2>총 금액 : <span id="totalPrice">0</span>원</h2>
	                    <input type="submit" id="submit" value="구매하기"/>
	                </div>
		        </div>
		        <form action="liftOrder.li" method="post" id="liftForm"> </form>
		    </div>
		</div>
    </div>
<jsp:include page="../common/footer.jsp" />

<script>
$(document).ready(function() {
	const memberId = "${sessionScope.loginMember != null ? sessionScope.loginMember.memberId : ''}"; 
	
    const dayPass = [
        { liftNo: 400, liftPrice: ${dayPass[0].liftPrice} },
        { liftNo: 401, liftPrice: ${dayPass[1].liftPrice} },
        { liftNo: 402, liftPrice: ${dayPass[2].liftPrice} },
        { liftNo: 403, liftPrice: ${dayPass[3].liftPrice} },
        { liftNo: 404, liftPrice: ${dayPass[4].liftPrice} },
        { liftNo: 405, liftPrice: ${dayPass[5].liftPrice} }
    ];
    
    let orderList = [];

    // Function to format price with commas
    function formatPrice(price) {
        return price.toLocaleString();
    }

    // Function to update total price
    function updateTotalPrice() {
        let total = 0;
        orderList.forEach(item => {
            total += item.totalPrice;
        });
        $('#totalPrice').text(formatPrice(total));
    }
    
    function updateOrderList() {
        $('#orderList').empty();
        orderList.forEach((item, index) => {
            const itemRow = `
                <tr>
                    <td width="28%">\${item.type}&nbsp;&nbsp;\${item.age}
                    </td>
                    <td width="33%">
                        <button class="countBtn" data-index="\${index}" data-action="decrease" id="countBtn1">-</button>
                        \${item.count}
                        <button class="countBtn" data-index="\${index}" data-action="increase" id="countBtn2">+</button>
                    </td>
                    <td width="25%">\${formatPrice(item.totalPrice)}원</td>
                    <td width="20%">
                        <button class="deleteBtn" data-index="\${index}">x</button>
                    </td>
                </tr>`;
            $('#orderList').append(itemRow);
        });
        updateTotalPrice();
    }
    

    $('#submit').click(function (event) {
    	if (${empty sessionScope.loginMember}) { 
      alert("로그인 후 이용 가능합니다.");
      location.href = "login.me"; 
  } else {
         if (orderList.length === 0) {
             alert('주문 항목을 추가하세요.');
             return;
         } else {
        	 
        	 $('form').find('input[name^="li["]').remove();

             // orderList 데이터를 폼에 추가
             orderList.forEach((item, index) => {
                 $('form').append(`
                     <input type="hidden" name="liftNo" value="\${item.liftNo}" />
                     <input type="hidden" name="liftCount" value="\${item.count}" />
                     <input type="hidden" name="liftTotalPrice" value="\${item.totalPrice}" />
                     <input type="hidden" name="memberId" value="\${memberId}" />
                 `);
             });
             // 폼 제출
             $('#liftForm').submit();
         }
  		}
    });


    
    $('#addItem').click(function () {
        const type = $('#liftType').val();
        const age = $('#liftAge').val();

        if (!type || !age) {
            alert('종류와 연령대를 선택해주세요.');
            return;
        }

        const liftNoMap = {
            '오전권': { '대인': 400, '소인': 401 },
            '오후권': { '대인': 402, '소인': 403 },
            '종일권': { '대인': 404, '소인': 405 }
        };

        const liftNo = liftNoMap[type][age];
        const price = dayPass.find(item => item.liftNo === liftNo).liftPrice;

        const existingIndex = orderList.findIndex(item => item.type === type && item.age === age);

        if (existingIndex > -1) {
            orderList[existingIndex].count += 1;
            orderList[existingIndex].totalPrice = orderList[existingIndex].count * price;
        } else {
            orderList.push({
                type: type,
                age: age,
                count: 1,
                price: price,
                totalPrice: price,
                liftNo: liftNo
            });
        }

        updateOrderList();
    });


    // Update count (increase or decrease)
    $(document).on('click', '.countBtn', function() {
        const index = $(this).data('index');
        const action = $(this).data('action');
        const price = orderList[index].price;

        if (action === 'increase' && orderList[index].count < 10) {
            orderList[index].count += 1;
        } else if (action === 'decrease' && orderList[index].count > 1) {
            orderList[index].count -= 1;
        }

        orderList[index].totalPrice = orderList[index].count * price;
        updateOrderList();
    });

    // Delete item from order list
    $(document).on('click', '.deleteBtn', function() {
        const index = $(this).data('index');
        orderList.splice(index, 1);
        updateOrderList();
    });
});
</script>
</body>
</html>