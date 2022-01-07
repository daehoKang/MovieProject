<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page session="false" %>
<!DOCTYPE html>
<html >

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>MovieProject</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
		<%@ include file="../includes/sideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
				<%@ include file="../includes/topBar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">회원가입페이지 - MemberJoinForm.jsp</h1>
                        
                    </div>

                    <!-- Content Row -->
					<div class="row" style="background-color: white;">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입 !</h1>
                            </div>
                            <form action="memberJoin" method="post" onsubmit="return joinFormCheck();"  enctype="multipart/form-data" class="user">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="inputMid" >아이디</label>
                                        <input type="text" id="inputMid" name="mid" class="form-control form-control-user" placeholder="아이디입력...">
                                        <span id="idCheckMsg" style="font-size: 15px;" ></span>
                                    </div>
                                    <div class="col-sm-6">
                                 	<label for="inputMpw">비밀번호</label>
                                        <input type="text" id="inputMpw" name="mpw" class="form-control form-control-user" placeholder="비밀번호입력...">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="inputMname" >이름</label>
                                        <input type="text" id="inputMname" name="mname" class="form-control form-control-user" placeholder="이름입력...">
                                    </div>
                                    <div class="col-sm-6">
                                    <label for="inputMbirth" >생년월일</label>
                                        <input type="date" id="inputMbirth" name="mbirth" class="form-control form-control-user">
                                    </div>
                                </div>
                                <!-- 다음 우편 서비스 시작 -->
                                <div class="form-group">
                                <label for="inputMemail" >이메일</label>
                                    <input type="email" id="inputMemail" name="memail" class="form-control form-control-user" placeholder="이메일입력...">
                                </div>
                                <div class="form-group row">
                                <div class="col-12">
                                	<label>주소</label>
                                </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    
                                        <input type="text" name="postcode" id="sample6_postcode" class="form-control form-control-user" placeholder="우편번호">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="button"  onclick="sample6_execDaumPostcode()" class="btn btn-primary btn-user btn-block" value="우편번호 검색">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="address" id="sample6_address" class="form-control form-control-user" placeholder="주소">
                                </div>
                                 <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" name="detailAddress" id="sample6_detailAddress" class="form-control form-control-user" placeholder="상세주소">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" name="extraAddress" id="sample6_extraAddress" class="form-control form-control-user" placeholder="참고항목">
                                    </div>
                                </div>
                                <!--  다음 우편 서비스 끝 -->
                                <div class="form-group">
                                <label for="mfilename" >프로필</label>
                                    <input type="file" id="mfilename" name="mfile" class="form-control form-control-user" >
                                </div>
                                
                                
                                <input type="submit" class="btn btn-primary btn-user btn-block" value="회원가입">
                                    
                       
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="memberLoginForm">Already have an account? Login!</a>
                                
                            </div>
                        </div>                   
                    </div>
                </div>
                    <!-- Content Row -->

                    <!-- Content Row -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->


            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
   

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    	function sample6_execDaumPostcode() {
       	 new daum.Postcode({
           	 oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	</script>
	
	<script type="text/javascript">
	
		var checkId = false;
	
	$(document).ready(function(){
		
		$("#inputMid").keyup( function(){ 
			var userInputId = $("#inputMid").val();
			console.log("입력한 아이디 : " + userInputId);
			
			if(userInputId.length <= 0){
				$("#idCheckMsg").css("color","red").text("아이디를 입력해 주세요!");
					check = false;
			} else {
				$.ajax({ 
					type : "get",
					url : "memberIdCheck",
					data : { "userInputId" : userInputId },
					success : function(result){  
						console.log("result : " + result);
						if(result == "OK"){
							$("#idCheckMsg").css("color","green").text("사용가능한 아이디");
								checkId = true;
						} else {
							$("#idCheckMsg").css("color","red").text("중복된 아이디");
								checkId = false;
						}
					},
					error : function(){
						alert("ajax 연결 실패!");
					}
				});
			}
			
			
			
		});
		
		
	});

	</script>
	
	<script type="text/javascript">
		
		function joinFormCheck(){
			
			console.log("회원가입 폼 체크 : " + checkId);
			if(!checkId){
				alert("아이디를 확인해주세요");
				$("#inputMid").focus();
				return false;
			}

			var checkMpw = $("#inputMpw").val(); 
			/* var checkMpw = document.getElementById("inputMpw").value; */
			if(checkMpw == ""){
				console.log("비밀번호를 입력해야합니다.");
				alert("비밀번호를 입력해주세요");
				$("#inputMpw").focus();
				return false;
			}
			
			var checkMname = $("#inputMname").val();
			
			if(checkMname == ""){
				console.log("이름을 입력해야합니다.");
				alert("이름을 입력해주세요");
				$("#inputMname").focus();
				return false;

			}
		}
	
	</script>
	
	
	
</body>

</html>