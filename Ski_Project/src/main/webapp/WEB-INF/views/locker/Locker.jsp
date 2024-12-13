<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
   


	.hero {
	    position: relative;
	    background: url('${pageContext.request.contextPath}/resources/images/room/mainResort.jpg') no-repeat center center;
	    background-size: cover;
	    height: 500px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}


  .overlay {
    text-align: center;
    color: #fff;
    background: rgba(0, 0, 0, 0.5);
    padding: 20px;
    border-radius: 10px;
  }

  .hero .overlay h1 {
      font-size: 36px;
      margin: 0;
    }

    .hero .overlay p {
      font-size: 18px;
      margin: 10px 0;
    }

  .search-box {
    margin-top: 100px;
    background: rgba(255, 255, 255, 0.9);
    padding: 15px 20px;
    border-radius: 10px;
    display: inline-block;
    text-align: left;
  }

  .search-box form {
    display: flex;
    gap: 15px;
    align-items: center;
  }

  .input-group {
    display: flex;
    flex-direction: column;
  }

  .input-group label {
    font-size: 14px;
    margin-bottom: 5px;
    color: #333;
  }

  .input-group input,
  .input-group select {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
  }

  .search-btn {
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
  }

  .search-btn:hover {
    background-color: #555;
  }

    .content {
      text-align: center;
      padding: 40px 20px;
    }

    .content h2 {
      font-size: 28px;
      margin-bottom: 10px;
    }

    .content p {
      color: #555;
      font-size: 18px;
      line-height: 1.5;
    }
    
    a {
	    text-decoration: none; /* 밑줄 제거 */
	    color: black; /* 글씨 색상을 검정색으로 */
	}

    .rooms {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 20px;
      padding: 20px;
      max-width: 1200px;
      margin: 0 auto;
    }

    .room {
      background: #fff;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      transition: transform 0.3s;
    }

    .room:hover {
      transform: scale(1.05);
    }

    .room img {
      width: 100%;
      height: 300px;
      object-fit: cover;
    }

    .room-details {
      padding: 15px;
    }

    .room-details h3 {
      margin: 0;
      font-size: 20px;
    }

    .room-details p {
      color: #777;
      font-size: 14px;
      margin: 10px 0;
    }

    .room-details .btn {
      display: inline-block;
      background: #c9a53b;
      color: #fff;
      padding: 8px 12px;
      border-radius: 4px;
      text-decoration: none;
      font-size: 14px;
    }

    /*-------------------*/

	.garden {
	  display: flex;
	  align-items: center;
	  padding: 40px 20px;
	  background-color: #f5f5f5;
	}
	
	.garden-content {
	  display: flex;
	  gap: 20px;
	  max-width: 1200px;
	  margin: 0 auto;
	  padding-left: 20px; /* 왼쪽 간격을 넓힘 */
	}
	
	.garden-img {
	  width: 50%;
	  border-radius: 8px;
	}
	
	.garden-text {
	  padding-left : 20px;
	  width: 50%;
	  display: flex;
  	  flex-direction: column;
  	  justify-content: center; /* 텍스트 수직 중앙 정렬 */
	}
	
	.garden-text h2 {
	  font-size: 28px;
	  margin-bottom: 10px;
	}
	
	.garden-text p {
	  
	  font-size: 16px;
	  color: #555;
	  line-height: 1.8; /* 문장 간격을 넓힘 */
	  letter-spacing: 0.5px; /* 문자 간격을 넓힘 */
	}

	.garden-text a {
	    text-align : right;
		padding-bottom : 10px;
	}


	
	  .facilities {
	    padding: 40px 20px;
	    text-align: center;
	  }
	
	  .facilities h2 {
	    font-size: 28px;
	    margin-bottom: 20px;
	  }
	
  /* 슬라이드 편의시설 */
  .carousel {
    position: relative;
    overflow: hidden;
    max-width: 1200px;
    margin: 0 auto;
  }

  .carousel-track {
    display: flex;
    transition: transform 0.3s ease-in-out;
  }

  .carousel-item {
    min-width: 33.33%; /* 한 번에 3개씩 보여지도록 */
    text-align: center;
    padding: 10px;
  }

  .carousel-item img {
    width: 100%;
    height: 350px;
    border-radius: 8px;
  }

  .carousel-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 50%;
    padding: 10px;
    cursor: pointer;
  }

  .prev-btn {
    left: 10px;
  }

  .next-btn {
    right: 10px;
  }
	  .prev-btn {
	    left: 10px;
	  }
	
	  .next-btn {
	    right: 10px;
	  }


      body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    padding: 20px;
}

.container {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
    padding: 150px;
}

.product {
    background-color: #ffffff;
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.product img {
    width: 100%;
    height: auto;
}

.product-info {
    padding: 15px;
}

.product-info h3 {
    font-size: 16px;
    color: #333;
    margin-bottom: 10px;
}

.product-info p {
    font-size: 14px;
    color: #666;
    margin: 5px 0;
}

.price {
    font-weight: bold;
    margin-top: 10px;
}

.price .highlight {
    color: #e74c3c;
    font-size: 18px;
}

.price .original-price {
    text-decoration: line-through;
    color: #999;
    font-size: 14px;
    margin-left: 5px;
}

.buy-btn {
    display: block;
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    background-color: burlywood;
    color: #fff;
    border: none;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
    text-align: center;
}

.buy-btn:hover {
    background-color: rgb(188, 153, 106);
}


.modal {
  display: none;
  position: fixed;
  z-index: 1000;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  border-radius: 8px;
  width: 80%;
  max-width: 500px;
  text-align: center;
}

.close-btn {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}

.close-btn:hover,
.close-btn:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.submit-btn {
  background-color: burlywood;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}

.submit-btn:hover {
  background-color: rgb(188, 153, 106);
}

  </style>
</head>
<body>


  <div class="hero">
    
  </div>


<div class="container">
    <c:forEach items="${lockers}" var="locker">
        <div class="product">
            <!-- 이미지 경로를 락커 번호 기반으로 하드코딩 -->
            <img src="${pageContext.request.contextPath}/resources/images/locker/locker${locker.lockerNo}.jpg" alt="락커 ${locker.lockerNo} 이미지">
            <div class="product-info">
                <h3>락커 번호: ${locker.lockerNo}</h3>
                <p>가격: ${locker.lockerPrice}원</p>
                <button class="buy-btn">구매</button>
            </div>
        </div>
    </c:forEach>
</div>


        
        <div id="paymentModal" class="modal">
  <div class="modal-content">
    <span class="close-btn">&times;</span>
    <h2>결제 정보 입력</h2>
    <form id="paymentForm">
      <label for="userName">이름:</label>
      <input type="text" id="userName" name="userName" required>
      
      <label for="address">주소:</label>
      <input type="text" id="address" name="address" required>
      
      <label for="phone">전화번호:</label>
      <input type="tel" id="phone" name="phone" required>
      
      <button type="submit" class="submit-btn">결제하기</button>
    </form>
  </div>
</div>
    </div>

<script>
document.querySelectorAll('.buy-btn').forEach(button => {
	  button.addEventListener('click', () => {
	    document.getElementById('paymentModal').style.display = 'block';
	  });
	});

	document.querySelector('.close-btn').addEventListener('click', () => {
	  document.getElementById('paymentModal').style.display = 'none';
	});

	window.addEventListener('click', event => {
	  if (event.target === document.getElementById('paymentModal')) {
	    document.getElementById('paymentModal').style.display = 'none';
	  }
	});

	// 결제 폼 제출
	document.getElementById('paymentForm').addEventListener('submit', event => {
	  event.preventDefault();
	  alert('결제가 완료되었습니다!');
	  document.getElementById('paymentModal').style.display = 'none';
	});

</script>
	


</body>
</html>