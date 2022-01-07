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
                        <h1 class="h3 mb-0 text-gray-800" >관리자 전체영화관목록 - Admin_TheaterList.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-danger">전체 영화관 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th>영화관코드</th>
                                            <th>영화관이름</th>
                                            <th>주소</th>
                                            <th>전화번호</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>영화관코드</th>
                                            <th>영화관이름</th>
                                            <th>주소</th>
                                            <th>전화번호</th>
                                            <th>관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    
                                    <c:forEach items="${theaterList }" var="theater">
                                        <tr>
                                        	<td>${theater.thcode }</td>
                                            <td>${theater.thname }</td>
                                            <td>${theater.thaddress }</td>
                                            <td>${theater.thtel }</td> 
                                            <th><a class="btn btn-sm btn-danger text-xs" href="#" onclick="theaterView('${theater.thcode}', '${theater.thname}', '${theater.thaddress}', '${theater.thtel}' )" data-toggle="modal" data-target="#theaterViewModal">상세정보</a>
                                            <c:choose>
                                            		<c:when test="${theater.thstate == 0 }">
                                            		<a class="btn btn-sm btn-danger text-xs" 
                                            		   href="Admin_ThState?thcode=${theater.thcode }&thstate=1" >
                                            		   활성화
                                            		</a>
                                            		</c:when>
                                            		<c:when test="${theater.thstate == 1 }">
                                            		<a class="btn btn-sm btn-secondary text-xs" 
                                            		   href="Admin_ThState?thcode=${theater.thcode }&thstate=0" >
                                            		   중지
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
    <div class="modal fade" id="theaterViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">영화관 상세 정보</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                        <div class="p-5">
                            <form action="Admin_TheaterModify" method="get">
                                <div class="form-group row">
                                    <label for="viewThcode">영화관코드</label>
                                        <input type="text" id="viewThcode"  disabled="disabled" class="form-control form-control-user" >
                                        <input type="hidden" name="thcode"  id="thcode"  class="form-control form-control-user" >
                                    </div>
								<div class="form-group row">
                                    <label for="viewThname">영화관이름</label>
                                        <input type="text" id="viewThname" name="thname" class="form-control form-control-user modifyInput" disabled="disabled" >
                                    </div>                                    
                                <div class="form-group row">
                                    	<label for="viewThaddress">주소</label>
                                        <input type="text" id="viewThaddress" name="thaddress" class="form-control form-control-user modifyInput" disabled="disabled"  >
                                    </div>
                                <div class="form-group row">
                                    <label for="viewThtel">전화번호</label>
                                        <input type="text" id="viewThtel"  name="thtel" class="form-control form-control-user modifyInput"  disabled="disabled"  >
                                    </div>

                                <button type="button" class="btn btn-danger" onclick="modifyInputToggle()">수정(활성/비활성)</button>
                                <input type="submit" class="btn btn-danger modifySubmit" id="submitBtn" style="float:right; " value="영화관정보수정">
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
		function theaterView(thcode, thname, thaddress, thtel){
			
			$("#thcode").val(thcode);
			$("#viewThcode").val(thcode);
			$("#viewThname").val(thname);
			$("#viewThaddress").val(thaddress);
			$("#viewThtel").val(thtel);
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