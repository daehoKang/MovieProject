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
    
        <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
	<style type="text/css">
		.modifySubmit{
			display: none;
		}
	
	</style>
	
	<script type="text/javascript">
		var msg = '${modifyMsg}';
		if( msg != ''){
			alert(msg);
		}
	</script>
	
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
                        <h1 class="h3 mb-0 text-gray-800" >관리자 전체영화목록 - Admin_MovieList.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-danger">전체 영화 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th>영화코드</th>
                                            <th>영화이름</th>
                                            <th>연령</th>
                                            <th>감독</th>
                                            <th>관리</th>
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>영화코드</th>
                                            <th>영화이름</th>
                                            <th>연령</th>
                                            <th>감독</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    
                                    <c:forEach items="${movieList }" var="movie">
                                        <tr>
                                        	<td>${movie.movcode }</td>
                                            <td>${movie.movname }</td>
                                            <td>
                                            <c:choose>
                                            	<c:when test="${movie.movgrade == 1}">
                                            		<span class="movGrade p-0 btn-circle bg-success">전체</span>
                                            	</c:when>
                                            	<c:when test="${movie.movgrade == 12}">
                                            		<span class="movGrade p-0 btn-circle bg-primary">${movie.movgrade }</span>
                                            	</c:when>
                                            	<c:when test="${movie.movgrade == 15}">
                                            		<span class="movGrade p-0 btn-circle bg-warning">${movie.movgrade }</span>
                                            	</c:when>
                                            	<c:when test="${movie.movgrade == 19}">
                                            		<span class="movGrade p-0 btn-circle bg-danger">청불</span>
                                            	</c:when>
                                            </c:choose>
                                            </td>
                                            <td>${movie.movdirector }</td>
                                            <th><a class="btn btn-sm btn-danger text-xs" href="#" onclick="movieView('${movie.movname}', '${movie.movcode}', '${movie.movgrade}', '${movie.movdirector}', '${movie.movgenre}', '${movie.movopen }', '${movie.movposter}' )" data-toggle="modal" data-target="#movieViewModal">상세정보</a>
                                            <c:choose>
                                            		<c:when test="${movie.movstate == 0 }">
                                            		<a class="btn btn-sm btn-danger text-xs" 
                                            		   href="Admin_MovState?movcode=${movie.movcode }&movstate=1" >
                                            		   예매시작
                                            		</a>
                                            		</c:when>
                                            		<c:when test="${movie.movstate == 1 }">
                                            		<a class="btn btn-sm btn-secondary text-xs" 
                                            		   href="Admin_MovState?movcode=${movie.movcode }&movstate=0" >
                                            		   예매중지
                                            		</a>
                                            		</c:when>
                                            	</c:choose>
                                            </th>
                                        </tr>
									</c:forEach>
									
                                    </tbody>
                                </table>
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
    
    <!-- MovieView Modal-->
    <div class="modal fade" id="movieViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">영화 상세 정보</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                        <div class="p-5">
                            <div class="text-center">
                                <h2 class="h4 text-gray-900 mb-4">
                                	<img class="img-fluid" id="viewMovposter" style="max-width: 300px;">
                                </h2>
                            </div>
                            <form action="Admin_MovieModify" method="get">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="viewMovcode">영화코드</label>
                                        <input type="text" id="viewMovcode"  disabled="disabled" class="form-control form-control-user" >
                                        <input type="hidden" name="movcode"  id="movcode"  class="form-control form-control-user" >
                                    </div>
                                    <div class="col-sm-6">
                                    <label for="viewMovname">영화이름</label>
                                        <input type="text" id="viewMovname" name="movname" class="form-control form-control-user modifyInput" disabled="disabled" >
                                    </div>                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label for="viewMovgrade">연령</label>
                                        <input type="text" id="viewMovgrade" name="movgrade" class="form-control form-control-user modifyInput" disabled="disabled"  >
                                    </div>
                                    <div class="col-sm-6">
                                    <label for="viewMovdirector">감독</label>
                                        <input type="text" id="viewMovdirector"  name="movdirector" class="form-control form-control-user modifyInput"  disabled="disabled"  >
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label for="viewMovgerne">장르</label>
                                        <input type="text" id="viewMovgenre" name="movgenre" class="form-control form-control-user modifyInput" disabled="disabled"  >
                                    </div>
                                    <div class="col-sm-6">
                                    <label for="viewMovopne">개봉</label>
                                        <input type="date" id="viewMovopen"  name="movopen" class="form-control form-control-user modifyInput"  disabled="disabled"  >
                                    </div>
                                </div>
                                
                                <button type="button" class="btn btn-danger" onclick="modifyInputToggle()">수정(활성/비활성)</button>
                                <input type="submit" class="btn btn-danger modifySubmit" id="submitBtn" style="float:right; " value="영화정보수정">
                             </form>
                        </div>                
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>    


    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>
    
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>
	
	<script type="text/javascript">
		function movieView(movname, movcode, movgrade, movdirector, movgenre, movopen, movposter){
			
			$("#movcode").val(movcode);
			$("#viewMovcode").val(movcode);
			$("#viewMovname").val(movname);
			$("#viewMovgrade").val(movgrade);
			$("#viewMovdirector").val(movdirector);
			$("#viewMovgenre").val(movgenre);
			$("#viewMovopen").val(movopen);
			$("#viewMovposter").attr("src","resources/poster/"+movposter);
			
		}	
		
		function modifyInputToggle(){
			var checkDisabled = $(".modifyInput").attr("disabled");
			console.log(checkDisabled);
			if(checkDisabled == 'disabled'){
				$(".modifyInput").removeAttr("disabled");
				$("#submitBtn").removeClass("modifySubmit");
			} else {
				$(".modifyInput").attr("disabled", "disabled");
				$("#submitBtn").addClass("modifySubmit");
			}
		}
		
		$("#movieViewModal").on('hidden.bs.modal', function(){
			$(".modifyInput").attr("disabled", "disabled");
			$("#submitBtn").addClass("modifySubmit");
		});
		

	</script>
	
</body>

</html>