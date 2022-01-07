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
     	border: 3px solid #858796; 
     	color:black;
     	font-weight: bold;
     }
     
     .selHallTime{
     	background-color: black;
     	color:white;
     	font-weight: bold;
     }
     
    </style>
    

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
                        <h1 class="h3 mb-0 text-gray-800" >관리자_스케쥴등록 - Admin_ScheduleRegistForm.jsp</h1>
                    </div>

                    <!-- Content Row -->
                    <!-- 영화/영화관/날짜/시간 영역-->
              <form action="Admin_ScheduleRegist" method="get" onsubmit="return scheduleFormCheck();">
					<div class="row"  >
						<div class="col-xl-4 col-md-6" >
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">영화</h6>
                                </div>
                                <div class="card-body list-Area" id="movieListArea">
                                
                                	<c:forEach items="${movieList }" var="movie">
                                		<div class="p-2 mb-1" onclick="movieSelect(this,'${movie.movcode }', '${movie.movname }')" >${movie.movname }</div>
                                	</c:forEach>
                                	                                                                                                                                                                                  
                                </div>
                            </div>
						</div>
						
						<div class="col-xl-4 col-md-6" >
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">영화관</h6>
                                </div>
                                <div class="card-body list-Area" id="theaterListArea">
                                	
                                	<c:forEach items="${theaterList }" var="theater">
                                		<div class="p-2 mb-1" onclick="theaterSelect(this,'${theater.thcode }', '${theater.thname }')" >${theater.thname }</div>
                                	</c:forEach>
                                    
                                </div>
                            </div>
						</div>
						
						<div class="col-xl-4 col-md-6" >
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">날짜
                                    </h6>
                                </div>
                                <div class="card-body list-Area" id="scDateArea">
                                    <div class="p-2 mb-1">
                                    <input type="date" name="scdate" id="selectScDate" onchange="scheduleDateSelect(this.value)"  class="form-control form-control-user" >
                                    </div>                   
                                </div>
                            </div>
						</div>
						
					</div>
                   <!-- Content Row -->
                    <!-- 상영관/시간 영역-->
					<div class="row"  >
						<div class="col-xl-7 col-md-6" >
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">상영관 및 시간</h6>
                                </div>
                                <div class="card-body" id="scHallTimeArea">
                                	<div class="p-2 mb-1">
                                	
                                	  1관<br>
                                		<input type="checkbox" style="display: none;" id="1관08:45"  name="scHallTime" value="08:45">
                                		<label for="1관08:45" class="btn btn-sm sctimeBtn"  onclick="hallTimeSelect(this)">08:45</label>
                                		
                                		<input type="checkbox" style="display: none;" id="1관11:45" name="scHallTime" value="11:45">
                                		<label for="1관11:45" class="btn btn-sm sctimeBtn" onclick="hallTimeSelect(this)">11:45</label>
                                		
                                		<input type="checkbox" style="display: none;" id="1관14:45" name="scHallTime" value="14:45">
                                		<label for="1관14:45" class="btn btn-sm sctimeBtn" onclick="hallTimeSelect(this)" >14:45</label>
                                		<input type="checkbox" style="display: none;" id="1관17:45" name="scHallTime" value="17:45">
                                		<label for="1관17:45" class="btn btn-sm sctimeBtn" onclick="hallTimeSelect(this)" >17:45</label>
                                	  <br>
                                	  	
                               		
                                	</div>
                                </div>
                            </div>
						</div>
						
						<div class="col-xl-5 col-md-6" >
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">스케쥴확인</h6>
                                </div>
                                <div class="card-body" >
                                 
 									<div class="p-2 mb-1" >
 										<input type="text" name="scmovcode" id="selectMovCode"  readonly="readonly" class="form-control form-control-user" >
 										<input type="text" id="selectMovName"  readonly="readonly" class="form-control form-control-user" >
 									</div>
 									<div class="p-2 mb-1" >
 										<input type="text" name="scthcode" id="selectThCode"  readonly="readonly" class="form-control form-control-user" >
 										<input type="text" id="selectThName"  readonly="readonly" class="form-control form-control-user" >
 									</div>
 								<!-- 	
 									<div class="p-2 mb-1" >
 										<input type="text" name="schall" id="selectSchall" readonly="readonly" class="form-control form-control-user" >
 										<input type="text" name="sctime" id="selectScTime" readonly="readonly" class="form-control form-control-user" > 									
 									</div>
 									 -->
 									<div class="p-2 mb-1" >
 										<input type="submit"  class="btn btn-sm btn-danger btn-block" value="스케쥴등록">
 									</div>
 									
                                </div>
                            </div>
						</div>
					</div>
					 
				</form>
					
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
	
		var selectMovCode = '';
		var selectThCode = '';
		var selectScDate = '';
		
		function movieSelect(obj, movcode, movname){
			/* 영화 목록 CSS 변경 */
			$("#movieListArea div").css("background-color","white").css("color","#858796").css("font-weight","normal");
			$(obj).css("background-color", "black").css("color","white").css("font-weight","bold");
			
			selectMovCode = movcode;
			$("#selectMovName").val(movname);
			$("#selectMovCode").val(movcode);
		}
			
		function theaterSelect(obj, thcode, thname){
			/* 영화관 목록 CSS 변경 */
			$("#theaterListArea div").css("background-color","white").css("color","#858796").css("font-weight","normal");
			$(obj).css("background-color", "black").css("color","white").css("font-weight","bold");
			selectThCode = thcode;
			$("#selectThName").val(thname);
			$("#selectThCode").val(thcode);
			//
			$("#selectSchall").val("");
			$("#selectScTime").val("");
			printScheduleList();
		}
		
		function scheduleDateSelect(scdate){
			selectScDate = scdate;
			printScheduleList();
		}
		
		var schallList = ["1관","2관","3관","4관","5관","6관"];
		var timeList = ["08:45","11:45","14:45","17:45","20:45","23:45"];
		
		function printScheduleList(){
			console.log(selectThCode);
			console.log(selectScDate);
			if(selectThCode != '' && selectScDate != ''){
				console.log("실행");
				var output = "";
				
				$.ajax({
					type : "get",
					url : "getTheaterScheduleList",
					data : { "scthcode" : selectThCode,
							 "scdate" : selectScDate	   
					},
					dataType : "json",
					async:false,
					success : function(thScList){
						console.log(thScList);
						var scHall = "";
						for(var i in schallList){
							output += "<div class='p-2 mb-1'>";
							output += "<span>" + schallList[i] +"</span><br>";
							var reserveTime = []; // [08:45, 11:45, 14:45]
							for(var z in thScList){
								if(thScList[z].schall == schallList[i]){ // 2관
									console.log(thScList[z].schall + " : " + schallList[i])
									reserveTime.push(thScList[z].sctime);
								}
							}
							for(var j in timeList){
								var checkTime = false;
								for(var a in reserveTime){
									if(timeList[j] == reserveTime[a]){
										checkTime = true;
									} 
								}
								/*
								 <input type="checkbox" id="1관08:45" name="scHallTimeArr" value="1관 08:45">
                                 <label for="1관08:45" class="btn btn-sm sctimeBtn m-1">08:45</label>
								*/
								
								if(checkTime){
									//output += "<button class=\"btn btn-sm font-weight-bold m-1 sctimeBtn_reg\" disabled >"+timeList[j]+"</button>";
									output += "<button class=\"btn btn-sm m-1 sctimeBtn\" disabled >"+timeList[j]+"</button>";
									
								} else {
									//output += "<button class=\"btn btn-sm font-weight-bold m-1 sctimeBtn\" onclick='hallTimeSelect(this, \""+schallList[i]+"\", \""+timeList[j]+"\" )' >"+timeList[j]+"</button>";
									output += "<input type='checkbox' class='d-none' id='"+schallList[i]+timeList[j]+"' name='scHallTimeArr' value='"+schallList[i]+" "+timeList[j]+"'>";
									output += "<label for='"+schallList[i]+timeList[j]+"' class='btn btn-sm sctimeBtn m-1 ' onclick='hallTimeSelect(this)' >"+timeList[j]+"</label>";
									        /* <input type="checkbox" class="d-none" id="1관08:45"  name="scHallTimeArr" value="1관 08:45"> */
								}
							}
							output +="</div>";
						}
					  //상영관 및 시간 목록 출력
						$("#scHallTimeArea").html(output);
					}
				});
				
				
				/*
				for(var i in schallList){
					//console.log(schallList[i]);
					output += "<div class='p-2 mb-1'>";
					output += schallList[i] + "<br>"
					for(var j in timeList){
						output += "<button class=\"btn btn-sm font-weight-bold m-1 sctimeBtn\" onclick='hallTimeSelect(this, \""+schallList[i]+"\", \""+timeList[j]+"\" )' >"+timeList[j]+"</button>";
					}
					output += "</div>"
				}	
				
				$("#scHallTimeArea").html(output);
				*/
				
			
			}
		}
		/*
		function hallTimeSelect(obj, schall, sctime){
			console.log(schall + "  " + sctime);
			//$("#scHallTimeArea button").css("background-color","white").css("color","#858796").css("font-weight","normal");
			//$(obj).css("background-color", "black").css("color","white").css("font-weight","bold");
			$("#scHallTimeArea button").removeClass("sctimeBtn_Select");
			$(obj).addClass("sctimeBtn_Select");
			
			$("#selectSchall").val(schall);
			$("#selectScTime").val(selectScDate+" "+sctime);
		}
		*/
		function hallTimeSelect(obj){
			$(obj).toggleClass("selHallTime");
			
		}		
		
		
		
		function scheduleFormCheck(){
			
			
			if($("#selectMovCode").val() == ''){
				alert("영화를 선택 해주세요!");
				return false;
			}
			if($("#selectThCode").val() == ''){
				alert("영화관을 선택 해주세요!");
				return false;
			}
			if($("#selectScDate").val() == ''){
				alert("날짜를 선택 해주세요!");
				return false;
			}
			
			var scHallTimeArr = document.getElementsByName("scHallTimeArr");
			var checkSc = true;
			for(var i in scHallTimeArr){
				if(scHallTimeArr[i].checked){
					checkSc = false;
				}
			}
			if(checkSc){
				alert("상영관 및 시간을 선택 해주세요!");
				return false;
			}

		}
		
		
	</script>

	<script type="text/javascript">
		$(document).ready(function(){
			var selmovcode = '${param.movcode }';
			if(selmovcode != ''){
				$("#"+selmovcode).click(); 
			}
		});
	</script>



</body>

</html>