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
    
    <style type="text/css">
     .list-Area div:hover {
     	cursor: pointer;
     }
     .sctimeBtn{
     	border: 1px solid #858796; 
     	color:black;
     }
     
    </style>
    

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
                        <h1 class="h3 mb-0 text-gray-800" >영화예매 페이지 - MovieReservation.jsp (영화코드 : ${param.movcode })</h1>
                    </div>

                    <!-- Content Row -->
                    <!-- 영화/영화관/날짜/시간 영역-->
					<div class="row"  >
						<div class="col-xl-3 col-md-6" >
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">영화</h6>
                                </div>
                                <div class="card-body list-Area" id="movieListArea">
                                
                                	<c:forEach items="${movieList }" var="movie">
                                		<div class="p-2 mb-1 " id="${movie.movcode }" onclick="movieSelect(this,'${movie.movcode }', '${movie.movname }', '${movie.movposter }')" >${movie.movname }</div>
                                	</c:forEach>
                                	      
                                	      
                                	                                                                                                                                                                                   
                                </div>
                            </div>
						</div>
						
						<div class="col-xl-3 col-md-6" >
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">영화관
                                    </h6>
                                </div>
                                <div class="card-body list-Area" id="theaterListArea">
                                	
                                  <!--   <div class="p-2 mb-1">cgv부평</div>  -->
                                    

                                    
                                </div>
                            </div>
						</div>
						
						<div class="col-xl-2 col-md-6" >
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">날짜
                                    </h6>
                                </div>
                                <div class="card-body list-Area" id="scDateArea">
                                    <!-- <div class="p-2 mb-1">11-02</div>          -->                   
                                </div>
                            </div>
						</div>
						
						<div class="col-xl-4 col-md-6"  >
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">상영관 및 시간
                                    </h6>
                                </div>
                                <div class="card-body" id="scHallTimeArea">
                                	
                                </div>
                            </div>
						</div>
						
					</div>
					
                    <!-- Content Row -->
                    <!-- 선택한 예매정보 영역 -->
					<div class="row" >
						<div class="col-12">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">예매 선택 확인</h6>
                                </div>
                                
                                <div class="row">
                                	<div class="col-xl-3 col-md-6">
                                		<div class="card-body" style="text-align: center;" >
                                    		<div class="p-2 mb-1 ">
												<img class="img-fluid" id="selectMovPoster" style="max-height: 200px;" >
											</div>
											<div class="p-2 mb-1" id="selectMovName" ></div>                            
                                		</div>
                                	</div>
                                	
                                	<div class="col-xl-3 col-md-6">
                                		<div class="card-body">
                                    		<div class="p-2 mb-1" id="selectThName"></div>
                                    		<div class="p-2 mb-1" id="selectScDate"></div>
                                    		<div class="p-2 mb-1" id="selectScHall"></div> 
                                		</div>
                                	</div>
                                	
                                	<div class="col-xl-3 col-md-6">
                                		<div class="card-body" >
                                    		<div class="p-2 mb-1">인원 선택</div>
                                    		<div class="p-2 mb-1" id="reCountArea">
                                    			<button class="btn btn-outline-dark" onclick="selectReCount(this,1)">1</button>
                                    			<button class="btn btn-outline-dark" onclick="selectReCount(this,2)">2</button>
                                    			<button class="btn btn-outline-dark" onclick="selectReCount(this,3)">3</button>
                                    			<button class="btn btn-outline-dark" onclick="selectReCount(this,4)">4</button>
                                    		</div>                            
                                		</div>
                                	</div>
                                	
                                	<div class="col-xl-3 col-md-6">
                                		<div class="card-body">
                                    		<div class="p-2 mb-1">
                                    			<form action="reserveMovie" method="post" onsubmit="return reserveFormCheck();">
                                    				<input type="hidden" value="${sessionScope.loginId }" id="remid" name="remid" placeholder="예매자아이디">
                                    				<input type="hidden" value="" id="reschall" name="reschall" placeholder="상영관">
                                    				<input type="hidden" value="" id="resctime" name="resctime" placeholder="날짜및시간">
                                    				<input type="hidden" value="" id="rescthcode" name="rescthcode" placeholder="영화관코드">		
                                    				<input type="hidden" value="" id="recount" name="recount" placeholder="예매인원수">
	                                  				<input class="btn btn-primary" type="submit" value="예매하기"> 
                                    			</form>
											</div>                            
                                		</div>
                                	</div>                                	
                                	
                                </div>
                            </div>
						</div>
					</div>

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
	
	
	<script type="text/javascript">
	
	
		var selMovcode = ""; 
		var selThcode = "";
		var selScDate = "";
		var selScHall = "";
		var selScTime = "";
		
		
		function movieSelect(obj, movcode, movname, movposter){
			selMovcode = movcode;
			/* 다른 목록 초기화 */
			//날짜 목록
			$("#scDateArea").html("");
			//상영관 및 시간 목록
			$("#scHallTimeArea").html("");
			
			/* 예매 선택 정보 영역 초기화 */
			// 영화관이름
			$("#selectThName").text("");
			// 선택 날짜
			$("#selectScDate").text("");
			// 선택 상영관
			$("#selectScHall").text("");
			
			/* 예매정보 form 초기화*/
			$("#reschall").val("");
			$("#resctime").val("");
			$("#rescthcode").val("");
			
			
			/* 영화목록 CSS 변경 */
			$("#movieListArea div").css("background-color","white").css("color","#858796").css("font-weight","normal");
			$(obj).css("background-color", "black").css("color","white").css("font-weight","bold");
			
			/* 선택 정보 입력 */
			$("#selectMovName").text(movname);
			$("#selectMovPoster").attr("src","resources/poster/"+movposter);
			
			var output = "";
			
			$.ajax({
				type : "get",
				url : "theaterList",
				data : { "movcode" : movcode },
				dataType : "json",
				async : false,
				success : function(theaterList){
					for(var i in theaterList){
						output += "<div class='p-2 mb-1' onclick='theaterSelect(this, \""+theaterList[i].thcode+"\" )'>"+theaterList[i].thname+"</div>";
					}
				}
			});
			
			/* 영화관 목록 출력  */
			$("#theaterListArea").html(output);
			
		}
			
		function theaterSelect(obj, thcode){
			var thname = $(obj).text();
			selThcode = thcode;
			
			/* 예매정보 form -  영화관코드 입력  */
			$("#rescthcode").val(thcode);
			
			/* 다른 목록 초기화 */
			//상영관 및 시간 목록 초기화
			$("#scHallTimeArea").html("");
			
			/* 예매 선택 정보 영역 초기화 */
			// 선택 날짜
			$("#selectScDate").text("");
			// 선택 상영관
			$("#selectScHall").text("");
			
			/* 예매정보 form 초기화*/
			$("#reschall").val("");
			$("#resctime").val("");
			
			
			/* 영화관 목록 CSS 변경 */
			$("#theaterListArea div").css("background-color","white").css("color","#858796").css("font-weight","normal");
			$(obj).css("background-color", "black").css("color","white").css("font-weight","bold");
			
			/* 선택 정보 입력 */
			$("#selectThName").text(thname);
			
			/* Ajax 상영 날짜 목록 조회 */
			var output = "";	
				
			$.ajax({
				type : "get",
				url : "scDateList",
				data : { "movcode" : selMovcode,
						 "thcode" : thcode
						},
				dataType : "json",
				async : false,
				success : function(scDateList){
					console.log("날짜목록");
					for(var i in scDateList){
						console.log(scDateList[i].sctime);
						output += "<div class='p-2 mb-1' onclick='dateSelect(this, \""+scDateList[i].sctime+"\" )' >"+scDateList[i].sctime+"</div>";
					}
				}
			});
			/* 날짜 목록 출력 */
			$("#scDateArea").html(output);
			
		}
		function dateSelect(obj, scDate){
			selScDate = scDate;
			/* 예매 선택 정보 영역 초기화 */
			// 선택 상영관
			$("#selectScHall").text("");
			
			/* 예매정보 form 초기화*/
			$("#reschall").val("");
			$("#resctime").val("");
			
			/* 날짜 목록 css 변경 */
			$("#scDateArea div").css("background-color","white").css("color","#858796").css("font-weight","normal");
			$(obj).css("background-color", "black").css("color","white").css("font-weight","bold");
			
			/* 선택 정보 입력 */
			$("#selectScDate").text(scDate);
			
			/* Ajax 상영관 및 시간 목록 조회 */
			var output = "";	
			$.ajax({
				type : "get",
				url : "scHallTimeList",
				data : { "movcode" : selMovcode,
						 "thcode" : selThcode,
						 "scDate" : scDate
						},
				dataType : "json",
				async : false,
				success : function(scHallTimeList){
					console.log("상영관 및 시간 목록");
					console.log(scHallTimeList);
					/*
					for(var i in scHallTimeList){
						output += "<div class='p-2 mb-1' onclick='hallTimeSelect(this, \""+scHallTimeList[i].schall+"\", \""+scHallTimeList[i].sctime+"\")' >"+scHallTimeList[i].schall+" "+scHallTimeList[i].sctime+"</div>";
					}
					*/
					var scHall = "";
					for(var i in scHallTimeList){
						if(scHall != scHallTimeList[i].schall){
							if( i != 0){
								output +="</div>";
							}
							scHall = scHallTimeList[i].schall; //
							output += "<div class='p-2 mb-1'>";
							output += "<span>" + scHall +"</span><br>";
						}
						output += "<button class=\"btn btn-sm font-weight-bold m-1 sctimeBtn\" onclick='hallTimeSelect(this, \""+scHallTimeList[i].schall+"\")' >"+scHallTimeList[i].sctime+"</button>";
					}
					output += "</div>";
					
					/*
                <div class="p-2 mb-1 ">
                     <span>3관</span><br>
                     <button class="btn btn-sm m-1">10:30</button>
                </div>
                
                <div class="p-2 mb-1 ">
                     <span>6관</span><br>
                    <button class="btn btn-sm m-1">11:30</button>
                     <button class="btn btn-sm m-1">14:35</button>
                     <button class="btn btn-sm m-1">18:45</button>
                </div>
					*/
					
					
					
					
				}
			});
			/* 상영관 및 시간 목록 출력 */
			$("#scHallTimeArea").html(output);
		}

		function hallTimeSelect(obj, schall){
			selScHall = schall;
			selScTime = $(obj).text();;
			$("#scHallTimeArea button").css("background-color","white").css("color","#858796").css("font-weight","normal");
			$(obj).css("background-color", "black").css("color","white").css("font-weight","bold");
			
			/* 예매 선택 확인  */
			$("#selectScDate").text(selScDate + " "+ selScTime);
			$("#selectScHall").text(selScHall);
			
			/* 예매정보 form - 날짜및시간 입력 */
			$("#resctime").val(selScDate + " "+ selScTime);
			/* 예매정보 form - 상영관 입력 */
			$("#reschall").val(selScHall);
			
		}
		
		function selectReCount(obj, countNum){
			/* 예매인원 선택 CSS */
			$("#reCountArea button").css("background-color","white").css("color","#858796").css("font-weight","normal");
			$(obj).css("background-color", "black").css("color","white").css("font-weight","bold");
			
			/* 예매정보 form - 예매인원수 입력 */
			$("#recount").val(countNum);
		}
		

	</script>
	
	
</body>

</html>