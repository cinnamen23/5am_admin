<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

    <%@ include file="/WEB-INF/views/header.jsp" %>
<link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet">

<style>
.img{
width: auto;
height: auto;
max-width: 600px;
max-height: 600px;
}
.list{
list-style: none;
}
</style>
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line"><a href="/notice/list">공지 사항</a></h4>
					
				</div>

			</div>
			<div class="row">
				<div class="col-md-12">
				
				<div class="row">
                <div class="col-md-12" >
                    <!-- Advanced Tables -->
                    <div class="panel panel-info">
                        <div class="panel-heading panel">${read.ntitle}
                        <p  style="float: right; font: 8px">작성자: ${read.nwriter}</p>
                        </div>
                        <div class="panel-body" >
                            <div class="table-responsive">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                <div class="col-sm-6" >
                                <div class="dataTables_length" id="dataTables-example_length">
                                <label>
                                
                                </div></div><div class="col-sm-6" ><div id="dataTables-example_filter" class="dataTables_filter">
                <label>
             
			    </label>
                               
                                </div></div></div>
                                <div  id="dataTables-example" aria-describedby="dataTables-example_info" style="height: 20px;"> 
                                  <div class="col-md-12 col-sm-12 col-xs-12"  style="height: 20px;">
                                <p style="float: right; font-size:12px;">조회수: ${read.hit}</p>
                                </div>  
                                  <div style="height: 20px;" class="col-md-12 col-sm-12 col-xs-12" >
                                  <p style="float: right; font-size:12px;">등록시간: ${read.regdate}</p>
                                 </div>
                                <div class="col-md-12 col-sm-12 col-xs-12">
                                 <p style="float: right; font-size:12px;">최종수정시간: ${read.updatedate}</p>
                                </div>
                                 
                                  <div class="col-md-12 col-sm-10 col-xs-12" style="margin: auto;" >
                 
                         
                                  <div class="uploadList">
                                  
                                  <p style="line-height:300%; letter-spacing: 2px; margin: auto" >  ${read.ncontent}</p>
                                  </div>   
                                  <div style="height: 150px">
                                  </div>
                             <form action="/notice/list" method="get">
                             <input type="hidden" name="page" value="${cri.page}">
                             <input type="hidden" name="nno" value="${read.nno}">
                             <input type="hidden" name="type" value="${cri.type}">
                             <input type="hidden" name="keyword" value="${cri.keyword}">
                             <button type="submit" class="btn btn-info"  style="float: left;">리스트</button>
                             </form>
                              <form action="/notice/update" method="get">
                             <input type="hidden" name="page" value="${cri.page}">
                             <input type="hidden" name="nno" value="${read.nno}">
                             <input type="hidden" name="type" value="${cri.type}">
                             <input type="hidden" name="keyword" value="${cri.keyword}">
                            <button type="submit" class="btn btn-info" style="float: right; margin: 5px;;" >수정</button> 
                             </form>
                            <form action="/notice/delete" method="get" id="deleteForm">
                            <input type="hidden" name="nno" value="${read.nno}">
                             <button class="btn btn-info" id="deleteBtn" style="float: right; margin: 5px;">삭제</button>   
                             </form>
                            </div>
                            
                            
                            </div>
                            
                                  
                                  
                                  
                                 
                                </div>
                        
                                </div>
                                 
                          
                            </div>
                            
                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	</div>
	</div>
	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function(e) {
	
	var result = '${update}';
	if (result == "success") {
		history.pushState(null, null);
		alert("글이 수정되었습니다.");
		window.onpopstate = function(e) {
			history.go(1);
		};
	}
	
	
	
	$("#deleteBtn").on("click",function(e){
		if (confirm("정말 삭제하시겠습니까??") == true){   
		    $("#deleteForm").submit();
		}else{   //취소
		    return;
		}


		
		
		
	})
				
						var str = "<li class='list'><img class='img' src='/display?fName="+"${read.nimage}"+"'></li>";
						
						$(".uploadList").append(str);
					
				
				
				
				
			})
</script>	
<%@ include file="/WEB-INF/views/footer.jsp" %>