<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<%@ include file="/WEB-INF/views/header.jsp"%>

<link href="assets/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">

<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line"><a href="/library/list">자료를 다운 받는 자료실입니다</a></h4>
					
				</div>

			</div>
				
				<div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-primary">
                        <div class="panel-heading panel"><h3><${lib.lno}> ${lib.ltitle } </h3> </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                <div class="col-md-12">
                                <div class="dataTables_length" id="dataTables-example_length">
                                <label>
                                
                                </div></div>
                                <div class="col-md-12">
				                                등록일 : ${lib.regdate} <br>
				                                수정일 : ${lib.updatedate}<br>
				                                조회수 : ${lib.hit} 
                             
                               <form class="form" action="/library/list" method="get">
	                              	<input type="hidden" name="page" value="${cri.page}" >
									<input type="hidden" name="lno" value="${lib.lno}">
									<input type="hidden" name="type" value="${cri.type}" >
									<input type="hidden" name="keyword" value="${cri.keyword}" >
			                        <input type="hidden" class="lfid" value="${lib.lfileid}">
                               
	                                <div id="dataTables-example_filter" class="dataTables_filter">
	

			                            <div class="panel-body">
			                            <h3><strong>다운로드 파일</strong></h3>
			                            <div class="alert alert-info">
			                                <h3>${lib.lcontent} <br></h3>
			                                <a href="http://localhost:8080/library/download?lfileid=${lib.lfileid}" class="alert-link ">${lib.lfile}<br></a>
			                            	파일을 다운 받으려면 위의 링크를 클릭하세요
			                            </div>
			                           <br>
                               </form>
			
			                           </div>
	                                </div>
                                </div>
                                </div>
                                <div class="row">
                                <div class="col-md-12">
                                <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">
                                <a href="#" class="btn btn-info modifyBtn">수정</a>
                                <a href="#" class="btn btn-info deleteBtn">삭제</a></div>
                                </div>
                                <div class="col-md-12">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                <a href="#" class="btn btn-info listBtn">목록</a>
                                
                                
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
	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function(e) {
	
	

	
//수정
	$(".modifyBtn").on("click", function(e){
		e.preventDefault();
		$(".form").attr("action","/library/update").submit();
	})
	
//삭제
	$(".deleteBtn").on("click", function(e){
		e.preventDefault();
		console.log("삭제")
		
		
		if(confirm("정말 삭제하시겠습니까??") == true){    //확인
			$(".form").attr("method","post").attr("action","/library/delete").submit();
		}else{   //취소
		    return;
		}
		})
	
//등록
	$(".listBtn").on("click", function(e){
		e.preventDefault();
		$(".form").submit();
	})
})
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>