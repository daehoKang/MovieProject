<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
                        <h1 class="h3 mb-0 text-gray-800">내정보페이지 - MemberView.jsp</h1>
                        
                    </div>

                    <!-- Content Row -->
                <div class="row"  >
                    <div class="col-lg-5 d-none d-lg-block " >
                    	<img class="img-fluid" alt=""  src="${pageContext.request.contextPath }/resources/profile/${memberView.mfilename }"> 
                    </div>
                    <div class="col-lg-7" style="background-color: white;">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">${memberInfo.mid } 님의 정보 페이지</h1>
                            </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="inputMid">아이디</label>
                                        <input type="text"  disabled="disabled" class="form-control form-control-user" value="${memberInfo.mid }">
                                    </div>
                                   
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label for="inputMname">이름</label>
                                        <input type="text" class="form-control form-control-user " disabled="disabled"  value="${memberInfo.mname }" >
                                    </div>
                                    <div class="col-sm-6">
                                    <label for="inputMbitrh">생년월일</label>
                                        <input type="date" class="form-control form-control-user"  disabled="disabled" value="${memberInfo.mbirth }" >
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                	<label for="inputMemail">이메일</label>
                                    <input type="email" class="form-control form-control-user"  disabled="disabled" value="${memberInfo.memail }" >
                                </div>
                                
                               <div class="form-group">
                                	<label for="inputMaddress">주소</label>
                                    <input type="text" class="form-control form-control-user"  disabled="disabled" value="${memberInfo.maddress }" >
                                </div>
                               <a href="${pageContext.request.contextPath }"  class="btn btn-primary btn-user btn-block">확인</a>
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



    

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>

</body>

</html>