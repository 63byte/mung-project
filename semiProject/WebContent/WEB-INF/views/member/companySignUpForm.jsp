<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header-footer</title>
    <head>
     <!--   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    부트스트랩 사용을 위한 라이브러리 추가
    jquery가 항상 먼저여야된다!
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script> -->
<style>
    /* 전체 글씨체 지정 */
*{
    font-family: 'Noto Sans KR', sans-serif;
    /* font-weight: 100; --> 굵기 지정 */
    font-weight: 500;
}

/* 전체 화면 */
.wrapper{
    width : 1100px;
    padding-bottom :5%;
    padding-top: 3%;
    margin : 0 auto;
    background-color : #f7f7f7 ;
}

/* 타이틀 */
.joinTitle{
    text-align : center;
    height: 80px;
    line-height : 60px;
    font-size : 30px;
}

/* 회원가입 입력 화면 */
.memberJoin{
    width: 400px;
    padding:0;
    margin : 0 auto;
    box-sizing: border-box;
}

/* 레이블 태그 class명*/
.lb{
    font-weight : bold;
    line-height: 25px;
    font-size: 13px;
    margin: 0 auto;
}

/* 인풋 태그 class명 */
.inputTag{
    margin: 0 auto;
    height:40px;
    width: 100%;
    padding : 0;
    border : 1px solid #bdbbbb;
}

/* inline-block 스타일 들어가야 하는 곳 전부 class 속성값 추가 */
.display-ib{
    display:inline-block;
}

/* 이메일 1번째 칸 */
.email{
    height:40px;
    width:180px;
}

/* 이메일 두번째 칸(옵션)*/
#email2{
    height : 45px;
    width:  195px;
}

/* 이메일 인증번호 입력하는 인풋창 */
#verifyEmail{
    width:260px;
    height:30px;
    margin-right : 25px;
}




/* number타입의 화살표 지우기 */
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button{
        -webkit-appearance: none;
		margin: 0;
}


/* 핸드폰번호 입력 input창 */
.phone{
    width : 119px;
    height : 45px;   
}

.gender{
    width: 100%;
}



/* 우편번호 */
.address{
    height:40px;
    width:180px;
    margin-right : 30px;
}

/* 사업자 등록증  */
.license{
	width : 70%;
	margin-right : 5px;
}

/* 이메일 인증 버튼, 우편번호 검색 버튼 */
.btn{
    height : 40px;
    width : 108px;
    padding : 0;
    border : 1px solid  #8bd2d6;
    background-color: #8bd2d6;
    color : #fffefe;
}

/* 회원가입 버튼 */
#submitBtn{
    margin: 0 auto;
    height:40px;
    width: 100%;
    font-size : 16px;
}




</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/otherHeader.jsp"></jsp:include>
 
  <div class="wrapper">
        <div class="joinTitle">
            <p style="font-size : 30px;"> 업체 회원가입</p>
        </div>
        <br>

        
        <form action="#" method="POST" onsubmit="return memberJoinvalidate();">
            <div class="memberJoin">
                <hr>

                <!-- 아이디 입력 -->
                <div>
                    <div class="lb">
                        <label for="userId">아이디</label> <br>
                    </div>
                    <div class="ip">
                        <input type="text" class="inputTag" id="userId" name="" autocomplete="off" required>
                    </div>
                    <div>
                        <span id="checkId" >&nbsp;</span>
                    </div>    
                </div>
                
                <!-- 비밀번호 입력 -->
                <div>
                    <div class="lb">
                        <label for="pwd1">비밀번호</label>  <br>
                    </div>
                    <div class="ip">
                        <input type="password" class="inputTag"  id="pwd1" name=""  required>
                    </div>     
                    <div>
                        <span id="chechPwd1" >&nbsp;</span>
                    </div>  
                </div>

                <!-- 비밀번호 재확인 -->
                <div>
                    <div class="lb">
                        <label for="pwd2">비밀번호 재확인</label> <br>
                    </div>
                    <div class="ip">
                        <input type="password" class="inputTag"  id="pwd2" name=""   required>
                    </div>
                    <div>
                        <span id="chechPwd2" >&nbsp;</span>
                    </div>  
                </div>
                
                <!-- 닉네임 -->
                <div>
                    <div class="lb">
                        <label for="userName">닉네임</label> <br>
                    </div>
                    <div class="ip">
                        <input type="text" class="inputTag"  id="userName" name="" required>
                    </div>
                    <div>
                        <span id="checkUserName" >&nbsp;</span>
                    </div> 
                </div>
                
                <!-- 이메일 -->
                <div>
                    <div class="lb">
                        <label for="email">이메일</label> <br>
                    </div>
                    <div class="ip">
                        <input type="text" class="inputTag display-ib email"  id="email1" name="" autocomplete="off" required> 
                        @
                        <select class="inputTag display-ib email" id="email2" name="" required>
                            <option style="color:gray;">이메일 주소 선택</option>
                            <option>daum.net</option>
                            <option>naver.com</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>
                            <option>hanmail.net</option>
                        </select>
                    </div>
                    <br>  
                    <div class="ip display-ib">
                        <input type="text" class="inputTag email" id="verifyEmail" placeholder="인증번호를 입력해주세요." required>
                    </div>
                    <div class="display-ib">
                        <input type="button" class="btn" id="emailBtn" style="height:30px;" value="인증번호 받기">
                    </div>
                    <div>
                        <span id="checkEmail" >&nbsp;</span>
                    </div> 
                </div>

                <!-- 전화번호 -->
                <div>
                    <div class="lb">
                        <label for="phone">전화번호</label>
                    </div>
                    <div class="ip">
                        <select class="display-ib inputTag phone" id="phone1" name="" required> 
                            <option>010</option>
                            <option>011</option>
                            <option>016</option>
                            <option>017</option>
                            <option>019</option>
                        </select>
                        &nbsp;-&nbsp;
                        <input type="number" class="display-ib inputTag phone" id="phone2" name="" required>
                        &nbsp;-&nbsp;
                        <input type="number" class="display-ib inputTag phone" id="phone3" name="" required>
                    </div>
                    <div>
                        <span id="checkPhone" >&nbsp;</span>
                    </div> 
                </div>

                <!-- 성별 -->
                <div>
                    <div class="lb">
                        <label for="gender">성별</label>
                    </div>
                    <div class="ip">
                        <select class="inputTag gender" id="gender" name="" required>
                            <option>성별</option>
                            <option>여자</option>
                            <option>남자</option>
                            <option>선택안함</option>
                        </select>
                    </div>
                </div>
                
                <br>
                <hr>
                <h3 style="font-weight:lighter;">업체 정보 기입</h3>
                <br>
                
                 <!-- 업체명 입력 -->
                <div class="rowGroup">
                    <div class="lb">
                        <label for="companyName">업체명</label> <br>
                    </div>
                    <div class="ip">
                        <input type="text" class="inputTag" id="companyName" name="" autocomplete="off" required>
                    </div>
                    <div>
                        <span id="checkCNM" >&nbsp;</span>
                    </div>    
                </div>
                
                <!-- 업체번호 -->
                <div >
                    <div class="lb">
                        <label for="phone">업체번호</label>
                    </div>
                    <div class="ip">
                        <select class="display-ib inputTag phone" id="phone1" name="" required> 
                            <option>02</option>
                            <option>051</option>
                            <option>053</option>
                            <option>032</option>
                            <option>062</option>
                            <option>042</option>
                            <option>052</option>
                            <option>044</option>
                            <option>031</option>
                            <option>033</option>
                            <option>043</option>
                            <option>041</option>
                            <option>063</option>
                            <option>061</option>
                            <option>054</option>
                            <option>055</option>
                            <option>064</option>
                            <option>070</option>
                        </select>
                        &nbsp;-&nbsp;
                        <input type="number" class="display-ib inputTag phone" id="phone2" name="" required>
                        &nbsp;-&nbsp;
                        <input type="number" class="display-ib inputTag phone" id="phone3" name="" required>
                    </div>
                    <div>
                        <span id="checkPhone" >&nbsp;</span>
                    </div> 
                </div>
                
                <!-- 주소 API  -->
                	<p style="font-size: 16px;" > 주소 </p>
                <div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="postcodify_search_button" style="font-weight:normal;font-size: 13px;">우편번호</label>
						</div>
						<div class="col-md-3 display-ib">
							<input type="text" name="post" class="form-control postcodify_postcode5 inputTag address">
						</div>
						<div class="col-md-3 display-ib">
							<button type="button" class="btn btn-primary" id="postcodify_search_button" >검색</button>
						</div>
					</div>

					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="address1" style="font-weight:normal;font-size: 13px;">도로명 주소</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="form-control postcodify_address inputTag" name="address1" id="address1">
						</div>
					</div>

					<div class="row mb-3 form-row">
						<div class="col-md-3">
							<label for="address2" style="font-weight:normal;font-size: 13px;">상세주소</label>
						</div>
						<div class="col-md-9">
							<input type="text" class="form-control postcodify_details inputTag" name="address2" id="address2">
						</div>
						<div>
                        <br>
                    </div> 
					</div>
                
                
                <!-- 사업자 등록증  -->
                
                <div>
                    <div class="lb">
                        <label for="license">사업자 등록증</label> <br>
                    </div>
                    <div class="ip display-ib license">
                        <input type="text" class="inputTag" id="license" name=""  required>
                    </div>
                    <div class="display-ib">
                        <input type="button" class="btn" id="licenseBtn" value="이미지첨부">
                    </div>
                </div>

                <br><br>
                
                
                <div class="submit">
                    <input class="btn" id="submitBtn" type="submit" name="" value="회원가입">
                </div>
            </div>
        </form>
    </div>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    

</body>
</html>