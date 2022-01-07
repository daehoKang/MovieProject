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
		<%@ include file="Admin_sideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
				<%@ include file="Admin_topBar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">영화등록페이지 - Admin_MovieResistForm.jsp</h1>
                        
                    </div>

                    <!-- Content Row -->
					<div class="row" style="background-color: white;">
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">영화등록</h1>
                            </div>
                             <form action="Admin_MovieRegist" method="post"  enctype="multipart/form-data" class="user">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="inputMovname" >영화이름</label>
                                        <input type="text" id="inputMovname" name="movname" class="form-control form-control-user" placeholder="영화이름입력...">                        
                                    </div>
                                    <div class="col-sm-6">
                                 	<label for="inputMovdirector">영화감독</label>
                                        <input type="text" id="inputMovdirector" name="movdirector" class="form-control form-control-user" placeholder="영화감독입력...">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="inputMovdirector" >영화장르</label>
                                        <input type="text" id="inputMovgenre" name="movgenre" class="form-control form-control-user" placeholder="영화장르입력...">
                                    </div>
                                    <div class="col-sm-6">
                                    <label for="inputMovgrade" >영화등급</label>
                                        <input type="number" id="inputMovgrade" name="movgrade" class="form-control form-control-user" placeholder="영화등급입력...">
                                    </div>
                                </div>
                                <div class="form-group">
                                <label for="inputMovopen" >영화개봉일</label>
                                    <input type="date" id="inputMovopen" name="movopen" class="form-control form-control-user">
                                </div>
                                <div class="form-group">
                                <label for="inputMovposter" >영화포스터</label>
                                    <input type="file" id="inputMovposter" name="pfile" class="form-control form-control-user" >
                                </div>
                                
                                
                                <input type="submit" class="btn btn-danger btn-user btn-block" value="영화등록">
                                    
                       
                            </form>
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


	
</body>

</html>