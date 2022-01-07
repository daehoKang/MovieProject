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
                        <h1 class="h3 mb-0 text-gray-800" >관리자 전체회원메뉴 - Admin_MemberList.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">전체 회원 목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>이메일</th>
                                            <th>관리(모달)</th>
                                            
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>이메일</th>
                                            <th>관리(모달)</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    
                                    <c:forEach items="${memberList }" var="member">
                                        <tr>
                                            <td>${member.mid }</td>
                                            <td>${member.mname }</td>
                                            <td>${member.memail }</td>
                                            <th><a class="btn btn-sm btn-danger" href="#" onclick="memberView('${member.mid }','${member.mpw }','${member.mname }','${member.mbirth }','${member.memail }','${member.maddress }','${member.mfilename }')" data-toggle="modal" data-target="#memberViewModal">상세정보</a>
                                            	<a class="btn btn-sm btn-success" href="#" onclick="reserveListView('${member.mid}')" data-toggle="modal" data-target="#reserveListViewModal">예매내역</a>
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
    
    <!-- MemberView Modal-->
    <div class="modal fade" id="memberViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">회원 상세 정보</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">
                                	<img class="img-profile rounded-circle img-fluid" id="viewMfilename" style="max-width: 50px;" >
                                	<span id="viewTitle"></span> 님의 상세정보
                                </h1>
                            </div>
                            <form action="Admin_MemberModify" method="get">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="viewMid">아이디</label>
                                        <input type="text" id="viewMid"  disabled="disabled" class="form-control form-control-user" >
                                        <input type="hidden" name="mid"  id="mid"  class="form-control form-control-user" >
                                    </div>
                                    <div class="col-sm-6">
                                    <label for="viewMpw">비밀번호</label>
                                        <input type="text" id="viewMpw" name="mpw" class="form-control form-control-user modifyInput" disabled="disabled" >
                                    </div>                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label for="viewMname">이름</label>
                                        <input type="text" id="viewMname" name="mname" class="form-control form-control-user modifyInput" disabled="disabled"  >
                                    </div>
                                    <div class="col-sm-6">
                                    <label for="viewMbitrh">생년월일</label>
                                        <input type="date" id="viewMbirth"  name="mbirth" class="form-control form-control-user modifyInput"  disabled="disabled"  >
                                    </div>
                                </div>
                                <div class="form-group">
                                	<label for="viewMemail">이메일</label>
                                    <input type="email" id="viewMemail" name="memail" class="form-control form-control-user modifyInput"  disabled="disabled" >
                                </div>
                               <div class="form-group">
                                	<label for="viewMaddress">주소</label>
                                    <input type="text" id="viewMaddress" name="maddress" class="form-control form-control-user modifyInput"  disabled="disabled"  >
                                </div>
                                <button type="button" class="btn btn-danger" onclick="modifyInputToggle()">수정(활성/비활성)</button>
                                <input type="submit" class="btn btn-danger modifySubmit" id="submitBtn" style="float:right; " value="회원정보수정">
                             </form>
                        </div>                
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
                </div>
            </div>
        </div>
    </div>    

	 <!-- ReserveListView Modal-->
    <div class="modal fade" id="reserveListViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 800px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><span id ="memberId"></span> 회원 예매 내역</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                           			<div class="table-responsive">
                                		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    		<thead>
                                        		<tr>
                                            		<th>영화제목</th>
                                            		<th>날짜 및 시간</th>
                                            		<th>영화관</th>
                                            		<th>상영관</th>
                                            		<th>예매인원</th>
                                        		</tr>
                                        	</thead>
                                        	
                                        	<tbody id="reserveListArea">
                                        		
                                        	</tbody>
                                        </table>
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
		function memberView(mid, mpw, mname, mbirth, memail, maddress, mfilename){
			$("#viewTitle").text(mid);
			
			$("#mid").val(mid);
			$("#viewMid").val(mid);
			$("#viewMpw").val(mpw);
			$("#viewMname").val(mname);
			$("#viewMbirth").val(mbirth);
			$("#viewMemail").val(memail);
			$("#viewMaddress").val(maddress);
			if(mfilename == ''){
				$("#viewMfilename").attr("src","resources/img/undraw_profile.svg");
			}else {
				$("#viewMfilename").attr("src","resources/profile/"+mfilename);
			}
			
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
		
		$("#memberViewModal").on('hidden.bs.modal', function(){
			$(".modifyInput").attr("disabled", "disabled");
			$("#submitBtn").addClass("modifySubmit");
		});
		

	</script>
	
	<script type="text/javascript">
		function reserveListView(mid){
			$("#memberId").text(mid);
			var output = "";
			
			$.ajax({
				type : "get",
				url : "Admin_getMemberReserveList",
				data : {"remid" : mid},
				dataType : "json",
				async : false,
				success : function(result){
					console.log(result);
					console.log(result == '');
					
					if(result == ''){
						output += "<tr><td colspan='5'>예매 내역이 없습니다.</td></tr>";
					
					} else {
						for ( var i in result){
							output += "<tr>";
							output += "<td>"+result[i].movname+"</td>";
							output += "<td>"+result[i].resctime+"</td>";
							output += "<td>"+result[i].thname+"</td>";
							output += "<td>"+result[i].reschall+"</td>";
							output += "<td>"+result[i].recount+"</td>";
							output += "</tr>";
						}
					}
					$("#reserveListArea").html(output);
				}
			});
			
		}
	
	</script>
	
	
	
	
	
	
	
	
	

</body>

</html>