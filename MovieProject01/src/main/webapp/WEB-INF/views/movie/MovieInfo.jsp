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
                        <h1 class="h3 mb-0 text-gray-800">영화 정보 페이지 - MovieInfo.jsp</h1>
                        
                    </div>

                    <!-- Content Row -->
					<div class="row" >
						<div class="col-12">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">영화 상세 정보</h6>
                                </div>
                                
                                <div class="row">
                                	<div class="col-xl-3 col-md-5">
                                		<div class="card-body" style="text-align: center;" >
                                    		<div class="p-2 mb-1 ">
												<img class="img-fluid" src="resources/poster/${movieInfo.movposter }" >
											</div>
                                		</div>
                                	</div>
                                	<div class="col-xl-9 col-md-7">
                                		<div class="card-body">
                                			<div class="p-2 mb-2" >제목 : ${movieInfo.movname }</div>
                                    		<div class="p-2 mb-2" >감독 : ${movieInfo.movdirector }</div>
                                    		<div class="p-2 mb-2" >장르 : ${movieInfo.movgenre }</div>
                                    		<div class="p-2 mb-2" >등급 : ${movieInfo.movgrade } 세 이상 관람가</div> 
                                    		<div class="p-2 mb-2" >개봉일 : ${movieInfo.movopen }</div>
                                    		<c:if test="${movieInfo.movstate == 1 }">
                                    		<div class="p-2 mb-2" > <a href="movieReservation?movcode=${movieInfo.movcode }" class="btn btn-danger">예매하기</a> </div>
                                			</c:if>
                                		</div>
                                	</div>
                                </div>
                            </div>
						</div>
					</div>
					
					
					<div class="row" >
						<div class="col-12">
                            <div class="card shadow mb-3">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">관람평</h6>
                                </div>
                             </div>
                        </div>
                        	 <c:forEach items="${mvcommentList }" var="mvcomment">
                             <div class="col-4">
                                <div class="card shadow mb-2">
                                	<div class="card-header py-3">
                                		<h6 class="m-0 font-weight-bold text-primary">
                                			<c:choose>
                                				<c:when test="${mvcomment.mc_recommend == 1 }">
                                					<i class="far fa-thumbs-up" style="font-size: 20px"></i>
                                				</c:when>
                                				<c:otherwise>
                                					<i class="far fa-thumbs-down" style="font-size: 20px"></i>
                                				</c:otherwise>
                                			</c:choose>
                                			 ${mvcomment.mc_mid }
                                		</h6>
                                	</div>
                                	
                                	<div class="card-body" style="color:black;">
                                		<p class="mb-0">${mvcomment.mc_comment } </p>
                                		<span style="font-size: 10px"> ${mvcomment.mc_date } </span>
                                	</div>
                             	</div>
                         	 </div>
                         	 </c:forEach>
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