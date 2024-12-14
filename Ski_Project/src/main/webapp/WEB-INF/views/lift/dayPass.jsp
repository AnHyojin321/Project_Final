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
        /*position: absolute;*/
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
        height: 110px;
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
    
</style>
</head>
<body>
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
            <img src="image/ski1.jpg">
        </div>
        <div class="purchaseDiv">
		    <div>
		        <div style="display:flex; gap:48%;">
		            <h1>24/25 일일권</h1>
		            <div style="flex:right; margin:auto;">
		                <a href="seasonPass.li">
		                    <input type="button" value="시즌권 구매하기"/>
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
		                        <td>50,000원</td>
		                    </tr>
		                    <tr>
		                        <td>오전권</td>
		                        <td>09:00-14:00</td>
		                        <td>소인</td>
		                        <td>35,000원</td>
		                    </tr>
		                    <tr>
		                        <td>오후권</td>
		                        <td>16:00-21:00</td>
		                        <td>대인</td>
		                        <td>55,000원</td>
		                    </tr>
		                    <tr>
		                        <td>오후권</td>
		                        <td>16:00-21:00</td>
		                        <td>소인</td>
		                        <td>40,000원</td>
		                    </tr>
		                    <tr>
		                        <td>종일권</td>
		                        <td>09:00-21:00</td>
		                        <td>대인</td>
		                        <td>90,000원</td>
		                    </tr>
		                    <tr>
		                        <td>종일권</td>
		                        <td>09:00-21:00</td>
		                        <td>소인</td>
		                        <td>70,000원</td>
		                    </tr>
		                </tbody>
		            </table>
		        </div>
		        <br>
		        <div id="purchaseInformation">
		            <form action="purchase.pu">
		                <h3>구매하기</h3>
		                <div>
		                    <table id="orderTable">
		                        <tr>
		                            <th class="pu">종류</th>
		                            <td class="pu">
		                                <select name="liftType" id="liftType" required>
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
		                                <select name="liftAge" id="liftAge" autocomplete="off">
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
		                    <input type="submit" id="submit" value="구매하기"/>
		                </div>
		            </form>
		        </div>
				<script>
					const prices = {
					    "오전권": { "대인": 50000, "소인": 35000 },
					    "오후권": { "대인": 55000, "소인": 40000 },
					    "종일권": { "대인": 90000, "소인": 70000 },
					};
					
					const orderList = document.getElementById('orderList');
					const totalPriceElement = document.getElementById('totalPrice');
					
					// 총 금액 계산 함수
					function updateTotalPrice() {
					    let total = 0;
					    document.querySelectorAll('#orderList tr').forEach(row => {
					        const price = parseInt(row.dataset.price, 10);
					        const quantity = parseInt(row.dataset.quantity, 10);
					        total += price * quantity;
					    });
					    totalPriceElement.textContent = total.toLocaleString();
					}
					
					// 아이템 삭제
					function deleteItem(event) {
					    const row = event.target.closest('tr');
					    row.remove();
					    updateTotalPrice();
					}
					
					// 수량 조정
					function adjustQuantity(event, adjustment) {
					    const row = event.target.closest('tr');
					    let quantity = parseInt(row.dataset.quantity, 10);
					    quantity += adjustment;
					    if (quantity < 1) return;  // 최소 1로 제한
					    row.dataset.quantity = quantity;
					    row.querySelector('.quantity').textContent = quantity;

					    // 가격 업데이트
					    const price = parseInt(row.dataset.price, 10);
					    row.querySelector('.price').textContent = (price * quantity).toLocaleString() + "원";

					    updateTotalPrice();  // 총 금액 업데이트
					}

					
					// 추가하기 버튼 이벤트
					document.getElementById('addItem').addEventListener('click', () => {
					    const liftType = document.querySelector('select[name="liftType"]').value;
					    const liftAge = document.querySelector('select[name="liftAge"]').value;

					    if (!liftType || !liftAge || liftType === "종류" || liftAge === "연령대") {
					        alert('종류와 연령대를 선택해주세요.');
					        return;
					    }

					    const price = prices[liftType][liftAge];

					    // 이미 같은 상품이 있는지 확인
					    const existingRow = Array.from(orderList.children).find(row => 
					        row.dataset.type === liftType && row.dataset.age === liftAge
					    );

					    if (existingRow) {
					        const quantity = parseInt(existingRow.dataset.quantity, 10) + 1;
					        existingRow.dataset.quantity = quantity;
					        existingRow.querySelector('.quantity').textContent = quantity;

					        // 가격 업데이트
					        existingRow.querySelector('.price').textContent = (price * quantity).toLocaleString() + "원";

					        updateTotalPrice();  // 총 금액 업데이트
					        return;
					    }

					    // 새로운 항목 추가
					    const newRow = document.createElement('tr');
					    newRow.dataset.type = liftType;
					    newRow.dataset.age = liftAge;
					    newRow.dataset.price = price;
					    newRow.dataset.quantity = 1;

					    newRow.innerHTML = `
					        <td width="20%">\${liftType}</td>
					        <td width="15%">\${liftAge}</td>
					        <td width="30%">
					        	<div id="quantityTd">
						        	<button type="button" class="countBtn1" onclick="adjustQuantity(event, -1)">-</button>
						            <span id="quantity" class="quantity">1</span>
						            <button type="button" class="countBtn2" onclick="adjustQuantity(event, 1)">+</button>					        	
					        	</div>
					        </td>
					        <td class="price" width="30%" style="margin-left:10%; font-size: 19px;">\${price.toLocaleString()}원</td>
					        <td width="5%"><button type="button" id="deleteBtn" onclick="deleteItem(event)">x</button></td>
					    `;

					    orderList.appendChild(newRow);
					    updateTotalPrice();  // 총 금액 업데이트
					});
				</script>
		    </div>
		</div>
    </div>
</body>
</html>