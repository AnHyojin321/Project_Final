<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>시즌권</title>
    <style>
        body {
            height: 100%;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }
        #outer {
            height: 100vh;
            display: flex;
        }
        table {
            border-spacing: 0px;
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
            height: 40px;
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
            padding: 10px 10px;
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
        }
        #submit{
            width: 100%;
            height: 50px;
            cursor: pointer;
            background-color : rgba(0, 0, 0, 0.1);
            border : 1px solid gray;
            border-radius : 5px;
            font-size : 18px;
            foint-weight : border;
        }
        
        #submit:hover {
        	background-color : rgba(0, 0, 0, 0.2);
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
            display: flexbox;
            flex-direction: column;
            width: 70%;
            overflow: auto; /* 내용이 넘치면 스크롤 생성 */
            border: 1px solid gray;/* 테두리 추가 (선택 사항) */
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            padding: 10px; /* 내부 여백 */
            box-sizing: border-box; /* 패딩을 크기 계산에 포함 */
            justify-content: center;
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
        .countBtn1 {
	    	width: 40%;
			height : 25px;
	    	border-radius-top-left: 5px;
	    	border-radius-bottom-left: 5px;
	    	border : none;
	        cursor: pointer;
	        margin:0px;
	        padding : 0px;
	        border-right : 1px solid lightgray;
	    }
	    .countBtn2 {
	    	width: 40%;
			height : 25px;
	    	border-radius-top-right: 5px;
	    	border-radius-bottom-right : 5px;
	    	border : none;
	        cursor: pointer;
	        margin:0px;
	        padding : 0px;
	        border-left: 1px solid lightgray;
	    }	
	    #deleteBtn {
	    	width: 25px;
	    	height: 25px;
	        border-radius: 10px;
	        border: none;
	        background-color: lightgray;
	        cursor: pointer;
	    }
	    #addItem {
	    	width: 10%;
	    	font-size: 10px;
	    	cursor: pointer;
	    	background-color : rgba(0, 0, 0, 0.1);
	    	border : 1px solid black;
	    	border-left : 1px solid gray;
	    	border-right : 1px solid gray;
	    }
	    
	    #addItem:hover {
	    	background-color: rgba(0, 0, 0, 0.2);
	    }
	    
	    .modal {
	        display: none;
	        position: fixed;
	        z-index: 1000;
	        left: 0;
	        top: 0;
	        width: 100%;
	        height: 100%;
	        background-color: rgba(0, 0, 0, 0.5);
	        justify-content: center;
	        align-items: center;
	    }
	
	    .modal-content {
	        background-color: white;
	        padding: 20px;
	        border-radius: 5px;
	        width: 400px;
	        text-align: center;
	    }
	
	    .modal-header {
	        font-size: 1.5rem;
	        margin-bottom: 10px;
	    }
	
	    .modal-body {
	        margin: 10px 0;
	    }
	
	    .modal-footer {
	        display: flex;
	        justify-content: space-around;
	    }
	
	    .modal-footer button {
	        padding: 10px 20px;
	        border: none;
	        border-radius: 5px;
	        cursor: pointer;
	    }
	
	    .modal-footer button.confirm {
	        background-color: green;
	        color: white;
	    }
	
	    .modal-footer button.cancel {
	        background-color: red;
	        color: white;
	    }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	<div id="outer">
	    <div class="purchaseDiv">
	        <div>
	            <div style="display:flex; gap:48%;">
	                <h1>24/25 시즌권</h1>
	                <div style="flex:right; margin:auto;">
	                    <a href="dayPass.li">
	                        <input type="button" value="일일권 구매하기" style="cursor:pointer" />
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
	                    <tr>
	                        <td colspan="2">24/25 시즌 전 기간 사용 가능</td>
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
	                            <td>시즌권</td>
	                            <td>09:00-21:00</td>
	                            <td>대인</td>
	                            <td>${seasonPass[0].liftPrice}</td>
	                        </tr>
	                        <tr>
	                            <td>시즌권</td>
	                            <td>09:00-21:00</td>
	                            <td>소인</td>
	                            <td>${seasonPass[1].liftPrice}</td>
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
	                                <select name="liftType" id="liftType" required>
	                                    <option selected>시즌권</option>
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
	                <br><br>
	                <div id="submitInformation">
	                    <h2>총 금액 : <span id="totalPrice">0</span>원</h2>
	                    <input type="submit" id="submit" value="구매하기" />
	                </div>
	            </div>
				<form action="liftOrder.li" method="post" id="liftForm"> </form>
				<!-- 모달창 -->
				<div id="modal" class="modal">
				    <div class="modal-content">
				        <div class="modal-header">결제 확인</div>
				        <div class="modal-body">
				            <p>주문 내역:</p>
				            <div id="modalOrderList"></div>
				            <p>결제하시겠습니까?</p>
				        </div>
				        <div class="modal-footer">
				           <button class="confirm" id="confirm">예</button>   
				           <button class="cancel">아니오</button>
				        </div>
				    </div>
				</div>
	        </div>
	    </div>
	    <div class="liftDiv">
	        <span class="textOverlay">
	            24/25 <br>SEASON PASS <br>
	            <span class="detail">
	                24/25 All Season <br>
	                Grooming Time (14:00-16:00)<br>
	            </span>
	        </span>
	        <img src="resources/images/liftImage2.jpg">
	    </div>
	</div>
<jsp:include page="../common/footer.jsp" />

<script>
$(document).ready(function() {
	const memberId = "${sessionScope.loginMember != null ? sessionScope.loginMember.memberId : ''}";
	
    const seasonPass = [
        { liftNo: 406, liftPrice: ${seasonPass[0].liftPrice} },
        { liftNo: 407, liftPrice: ${seasonPass[1].liftPrice} }
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
                    <td>\${item.type} \${item.age}
                    </td>
                    <td>
                        <button class="countBtn" data-index="\${index}" data-action="decrease">-</button>
                        <span>\${item.count}</span>
                        <button class="countBtn" data-index="\${index}" data-action="increase">+</button>
                    </td>
                    <td>\${formatPrice(item.totalPrice)}원</td>
                    <td>
                        <button class="deleteBtn" data-index="\${index}">x</button>
                    </td>
                </tr>`;
            $('#orderList').append(itemRow);
        });
        updateTotalPrice();
    }
    
    function showModal() {
        const modalOrderList = orderList.map(item => `
            <p>
        		\${item.type} (\${item.age}): \${item.count}개 - \${formatPrice(item.totalPrice)}원
        	</p>
        `).join('');
        $('#modalOrderList').html(modalOrderList);
        $('#modal').fadeIn();
    }

    function hideModal() {
        $('#modal').fadeOut();
    }

    $('#submit').click(function (event) {
    	if (${empty sessionScope.loginMember}) { 
      alert("로그인 후 이용 가능합니다.");
       location.href = "login.me"; 
  } else {
         if (orderList.length === 0) {
             alert('주문 항목을 추가하세요.');
             return;
         }
         showModal();
  }
    });

    $('#confirm').click(function () {
        hideModal();

        // 폼 안의 기존 hidden input 요소 초기화
        $('form').find('input[name^="li["]').remove();

        // orderList 데이터를 폼에 추가
        orderList.forEach((item, index) => {
            $('form').append(`
                <input type="hidden" name="li[\${index}].liftNo" value="\${item.liftNo}" />
                <input type="hidden" name="li[\${index}].liftCount" value="\${item.count}" />
                <input type="hidden" name="li[\${index}].liftTotalPrice" value="\${item.totalPrice}" />
                <input type="hidden" name="li[\${index}].memberId" value="\${memberId}" />
            `);
        });

        // 폼 제출
        $('#liftForm').submit();
    });



    $('.cancel').click(function () {
        hideModal();
    });

    
    $('#addItem').click(function () {
        const type = $('#liftType').val();
        const age = $('#liftAge').val();

        if (!type || !age) {
            alert('종류와 연령대를 선택해주세요.');
            return;
        }

        // LiftNo를 유형과 연령대에 따라 결정
        const liftNoMap = {
            '시즌권': { '대인': 406, '소인': 407 }
        };

        const liftNo = liftNoMap[type][age];
        const price = seasonPass.find(item => item.liftNo === liftNo).liftPrice;

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
