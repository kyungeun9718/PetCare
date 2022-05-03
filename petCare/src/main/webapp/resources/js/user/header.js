/*뒤로가기 막기*/
window.history.forward(); 

function noBack(){
	window.history.forward();
}

function fn_loginCheck() {
   var check_id = $("input[name='m_id']").val();
   var check_pw = $("input[name='m_pw']").val();

   if (check_id == "") {
      swal('E_mail 입력', 'E_mail을 입력해주세요', 'info');
      return;
   }
   if (check_pw == "") {
      swal('비밀번호 입력', '비밀번호를 입력해주세요', 'info');
      return;
   }
   if (check_id != "" && check_pw != "") {
      $.ajax({
         type: "POST",
         data: {
            "userId": check_id,
            "userPw": check_pw
         },
         url: "/user_login.do",
         dataType: "json",
         success: function(result) {
            if (result.msg == "status") {
			    swal({
					title: "로그인 불가.",
					text: "서류심사가 완료되지 않았습니다.",
					icon : "info",
				}, function(){
					location.reload();
				});
            } else if (result.msg == "idFail") {
               swal({
					title: "로그인 실패.",
					text: "E_mail을 확인하세요",
					icon : "error",
				}, function(){
					location.reload();
				});
            } else if (result.msg == "hos_success") {
                swal({
					title: "로그인 성공.",
					icon : "success",
					text: "환영합니다"
				}, function(){			
					window.location.href ="/home.do";
					$("#login_Div").hide();
				});
               
            } else if (result.msg == "pwFail") {
               swal({
					title: "로그인 실패.",
					icon : "error",
					text: "비밀번호를 확인하세요"
				}, function(){
					location.reload();
				});
            } else {
                swal({
					title: "로그인 성공.",
					icon : "success",
					text: "환영합니다."
				}, function(){
					window.location.href ="/home.do";					
				});
            }

         },
         error: function(error) {
            alert("error : " + error);
         }
      });

   }
}

function No_myPage(){
	swal('로그인 요청.', '로그인 후 이용가능합니다.', 'info');
}

function logout(){
	$.ajax({
         type: "POST",
         url: "/logout.do",
         success: function(data) {
	         swal({
						title: "로그아웃.",
						icon : "success",
						text: "성공적으로 로그아웃되었습니다."
					}, function(){
						window.location.href ="/home.do";					
					});
 			
         },
         error: function(error) {
            alert("error : " + error);
         }
      });
}
