<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <link href="/resources/css/user/index.css" rel="stylesheet">
    <link href="/resources/css/user/color.css" rel="stylesheet">
    <link href="/resources/css/user/text.css" rel="stylesheet">
    <link href="/resources/css/user/header.css" rel="stylesheet">
    <link href="/resources/css/user/footer.css" rel="stylesheet">
    <link href="/resources/css/user/button.css" rel="stylesheet">
    <link href="/resources/css/user/loginForm.css" rel="stylesheet">
    <link href="/resources/css/user/home.css" rel="stylesheet">
    <link href="/resources/css/user/ur_reservation.css?after" rel="stylesheet">
    <link href="/resources/css/user/datepicker_hospitalRV.css?after" rel="stylesheet" type="text/css" media="all">
  <!-- 제이쿼리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Air datepicker css -->
        <script src="/resources/js/user/datepicker.js"></script>
        <!-- Air datepicker js -->
        <script src="/resources/js/user/datepicker.ko.js"></script>
    
  <!--부트스트랩-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"  crossorigin="anonymous">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!--alert-->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
  <!-- 카카오 주소 -->
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- 경은이 카카오 MAP API-KEY -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e818982c81810e2470dd6b0b339e676&libraries=services"></script>
<script>
function checkboacArr(){
	var checkArr=[]; //배열의 초기화
	$("input[name='pet']:checked").each(function(i)) {
        checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
    }
    $.ajax({
        url: 'hospital_reservation_my_pet'
        , type: 'post'
        , dataType: 'text'
        , data: {
        	myPet: checkArr
        }
    });
}


</script>


</head>

<body>
<div id="pet-layout" class="background--white">
	<%@ include file="/WEB-INF/page/user/views/header.jsp"%>
<form method="post" action="/.do" enctype="multipart/form-data">
        <div class="board p-3 mb-5 bg-body rounded">
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">병원 이름</label>
                <input type="text" class="titlebox form-control" id="formGroupExampleInput" placeholder="">
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput2" class="form-label">예약자 성함</label>
                <input type="text" class="namebox form-control" id="formGroupExampleInput2">
            </div>
            <input type="hidden" value="${user.m_number}" name="m_number">
            
            <div class="mb-3">
                <label for="formGroupExampleInput2" class="form-label">날짜 선택</label>
                <div class="dateselect">
                    <input type="text" id="datepicker1" class="datepick" readonly>
                    <select name="job">
                        <option value="">시간선택</option>
                        <option value="오전 9시">오전 9시</option>
                        <option value="오전 10시">오전 10시</option>
                        <option value="오전 11시">오전 11시</option>
                        <option value="오후 1시">오후 1시</option>
                        <option value="오후 2시">오후 2시</option>
                        <option value="오후 3시">오후 3시</option>
                        <option value="오후 4시">오후 4시</option>
                        <option value="오후 5시">오후 5시</option>
                        <option value="오후 6시">오후 6시</option>
                    </select>
                </div>
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">반려동물 리스트</label>
                <div class="form-floating" style="height:150px; overflow:auto">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">선택</th>
                                <th scope="col">이름</th>
                                <th scope="col">나이</th>
                                <th scope="col">성별</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var ="mypet" items="${mypet}" varStatus="status"> 
                            <tr>
                                <th scope="row"><input type="checkbox" name="pet"></th>
                                <td>${mypet.mp_petName}</td>
                                <td>${mypet.mp_petAge} 살</td>
                                <td>${mypet.mp_petGender} </td>
                            </tr>
                         </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <a class="btn btn-primary" href="" role="button">예약하기</a>
            <a class="btn btn-secondary" href="" role="button">취소</a>
        </div>
</form>


<div class="pet-footer">
    <div>상호명 : 주식회사 PETCARE</div>
    <div class="text--12-lighter">주식회사 PETCARE은 의료정보의 중개서비스 또는 의료정보중개시스템의 제공자로서, <br>의료정보의 당사자가 아니며,
        의료정보와
        관련된 의무와 책임은 각 의료기관에게 있습니다.
    </div>
    <div class="text--12-lighter">
        © 2022 PetCare All right reserved
    </div>
</div>
</div>

<script src="/resources/js/user/ur_reservation.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/user/loginForm.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>