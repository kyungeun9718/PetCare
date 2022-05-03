<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.petcare.web.user.vo.MemberVO" %>
<link rel="mainicon" href="/resources/img/petcare_logo.png">
<script src="/resources/js/user/header.js"></script>
<header class="pet-header background--white" id="header">
<div class="pet-header__logo pet-row">
    <a href="home.do">
        <img class="logo" src="/resources/img/petcare_logo.png">
    </a>
    
    <c:if test="${empty user.m_id}">
    <div class="pet-header__join">
        <a href="javascript:openModal('modal1');" class="button modal-open text--14-normal" data-bs-target="#loginModal">로그인</a> 
        <a href="signinForm.do" class="button text--14-normal">회원가입</a> 	
    </div>
    </c:if>
    <c:if test="${not empty user.m_id}">
    <div class="pet-header__join">
    	<span id="login_memberID"><c:out value="${user.m_name}"/></span>님 로그인되었습니다.&nbsp;&nbsp; 
        <a href="javascript:void(0);" onclick="logout();" class="button text--14-normal">[ 로그아웃 ]</a> 	

    </div>
    </c:if>
    
</div>
<div class="pet-header__tabs pet-row">
    <a class="pet-header__tab text--16-normal color--black active" href="home.do">홈</a>
    <a class="pet-header__tab text--16-normal color--black" href="hospital.html">내주변 병원</a>
    <a class="pet-header__tab text--16-normal color--black" href="show.html">자랑하기</a>
    <a class="pet-header__tab text--16-normal color--black" href="qna.html">QnA</a>
    <a class="pet-header__tab text--16-normal color--black" href="ency_boardList.html">동물백과</a>
   
   <!-- 마이페이지 -->
   <c:if test="${user.m_role=='0'}">
    <a class="pet-header__tab text--16-normal color--black" role="button" id="user_myPage" data-bs-toggle="dropdown" aria-expanded="false">내정보</a>
	    <ul id="user_mypage" class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	        <li><a class="dropdown-item" href="/user_myPage_update.do">내 정보 수정</a></li>
	        <li><a class="dropdown-item" href="/user_myPage_resevation.do">내 예약 관리</a></li>
	    </ul>
	</c:if>
	
	<!-- 병원페이지 -->
	<c:if test="${user.m_role=='1'}">
	<a class="pet-header__tab text--16-normal color--black" role="button" id="partner_myPage" data-bs-toggle="dropdown" aria-expanded="true">내정보</a>
	    <ul id="partner_mypage" class="dropdown-menu" aria-labelledby="dropdownMenuLink">
	        <li><a class="dropdown-item" href="/partner_myPage_update.do">병원 정보 수정</a></li>
	        <li><a class="dropdown-item" href="/partner_myPage_resevation.do">예약자 현황</a></li>
	    </ul>
	</c:if>
	<c:if test="${empty user.m_role}">
	<!-- 로그인 안할때 -->
	<a class="pet-header__tab text--16-normal color--black" role="button" id="partner_myPage" aria-expanded="true" onclick="No_myPage()">내정보</a>
	</c:if>
 </div>  
 

<!--로그인 모달창-->
	<div id="modal"></div>
		<div class="modal-con modal1 shadow-lg" >
			<a href="javascript:;" class="close">X</a>
			<p class="title">로그인</p>
		   <div class="con">

				로그인 창

				<div class="card align-middle "
					style="width: 20rem; border-radius: 20px;">

					<div class="card-body">
						<form id="form_login" class="form-signin" method="POST" action="user_login.do">
							<input type="text" id="uid" name="m_id" class="form-control" placeholder="Email address" required autofocus><BR>
							<input type="password" id="upw" name="m_pw" class="form-control" placeholder="Password" required><br>
							<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button" onclick="fn_loginCheck()" style="margin: 0;">로 그 인</button>
							<button class="btn btn-lg btn-primary_kakao btn-block" style="margin: 0; margin-top: 10px;">
								<img src="/resources/img/kakao.png" class="kakao_img"> 카카오
								로그인
							</button>

							<div class="searchBox">
								<a href="/user_password.do">비밀번호 찾기</a><br> <a
									href="/signinForm.do">회원가입</a>
							</div>
							<label>제휴 병원 가입신청은 회원가입으로 진행해주세요</label>
						</form>
					</div>
				</div>

			<div class="modal"></div>
		</div>
	</div>


</header>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
