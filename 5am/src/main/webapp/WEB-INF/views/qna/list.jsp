<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

    <%@ include file="/WEB-INF/views/header.jsp" %>
<link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line" ><a href="/qna/list" style="color: black">Q&A</a></h4>

				</div>

			</div>
			
			
			
			
			
			
			
			
			<div class="row">
                <div class="col-md-12">
                
                
                	<div class="row">
                <div class="col-md-12">
                
                
                
                    <!-- Advanced Tables -->
                    <div class="panel panel-success">
                        <div class="panel-heading panel">목록  </div>
                        
                        <div class="panel-body">
                            <div class="table-responsive">
                            
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                
                                <div class="row">
                                <div class="col-sm-6">
                                <div class="dataTables_length" id="dataTables-example_length">
                              
                               
                                </div></div>
                                
                                <div class="col-sm-6">
                                
                                <div id="dataTables-example_filter" class="dataTables_filter">
                                
                                
                                <!-- 검색창 -->
                                
                                <label>
				                <form id="f1" >
								<input id="hqno" type="hidden" name="qno">
								
								<input id="hpage" type="hidden" name="page" value="${cri.page}">
				                
				                <select name="type" class="type" >
								<option value="n" ${cri.type eq null?'selected':''}>---</option>
								<option value="t" ${cri.type eq 't'?'selected':''}>title</option>
								<option value="c" ${cri.type eq 'c'?'selected':''}>content</option>
								<option value="w" ${cri.type eq 'w'?'selected':''}>writer</option>
							    </select> 
							    
							    <input type="search" class="form-control input-sm" aria-controls="dataTables-example" name="keyword" value="${cri.keyword}">
							    <button id="btnn"  class="btn btn-info">Search</button>
							    </form>
							    </label>
                                
                                <!-- 검색창 -->
                                
                                
                                </div></div></div>
                                
                                
                                
                                
                                
                                
                                <table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                    <thead>
                                        <tr role="row">
                                        <th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1"  aria-sort="ascending" style="width: 189px;">번호</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1"  style="width: 291px;">제목</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1"  style="width: 291px;">작성자</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1"  style="width: 160px;">등록날짜</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1"  style="width: 113px;">갱신날짜</th></tr>
                                    </thead>
                                    
                                    <tbody>
                                        
                                        
                                        
                                        
                                        
                                     	<c:forEach items="${list}" var="QuestionVO"> 
                                        <tr class="gradeA odd">
                                        
                                        	<td class="sorting_1" >${QuestionVO.qno} </td>
                                            <td><a class="goQview" href="${QuestionVO.qno}">${QuestionVO.title}</a></td>
                                            <td class=" ">${QuestionVO.writer}</td>
                                            <td class="center ">${QuestionVO.regdate}</td>
                                            <td class="center ">${QuestionVO.updatedate}</td>
                                        
                                        </tr>
                                        </c:forEach>
                                       
                                       </tbody>
                                </table>
                                
                                                             
                                
                                
                                <div class="row">
                                <div class="col-sm-6">
                                <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">
                                <form action="/qna/regi" method="get">
							    <button type="submit" class="btn btn-info">등록</button>
							    </form>
                                </div>
                                </div>
                                
                                
                                <div class="col-sm-6">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                
                                 <!-- 페이징 삽입 -->
                                <nav aria-label="Page navigation">
									<ul class="pagination">
										<c:if test="${pageMaker.prev}">
											<li><a class="prev" href="${pageMaker.start-1}"
												aria-label="Previous"> <span aria-hidden=false>&laquo;</span>
											</a></li>
										</c:if>
					
										<c:forEach begin="${pageMaker.start}" end="${pageMaker.end}"
											var="idx">
											<li class="${pageMaker.current ==idx?'active':''}">
											<a class="curr" href="${idx}">${idx}</a></li>
										</c:forEach>
					
										<c:if test="${pageMaker.next}">
											<li><a class="next" href="${pageMaker.end+1}" aria-label="Next">
													<span aria-hidden="${pageMaker.next}">&raquo;</span>
											</a></li>
										</c:if>
					
									</ul>
								</nav>
                                
                                <!-- 페이징 삽입 -->  
                                
                                
                                
                                </div>
                                
                                
                                </div>
                                </div>
                                </div>
                                </div>
                                
                                
                                
                            </div>
                            
                        </div>
                        
                        
                        
                    </div>
                    <!--End Advanced Tables -->
                </div> <!-- 하나 안쪽 div -->
                
                
                
            </div>    
          
           </div>  <!--리스트+등록 페이징 div  -->
         </div>

			
		</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	
	
	
	
	
	

	
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
	<script>
	
	
	$(document).ready(function() {
		
		var msg="${msg}";
		if(msg=="success"){
			history.pushState(null,null);
			alert("등록이 완료되었습니다 . ")
			window.onpopstate=function(e){
				history.go(1);
			}
		}
		
		
		
		$("#btnn").on("click", function(e) {
			e.preventDefault();
			 $("#hpage").val("1");
			$("#f1").attr('method', 'get');
			$("#f1").attr("action", "/qna/list").submit(); 
 
		});
		
		
		
		
		$(".goQview").on("click", function(e) {
			e.preventDefault();
			$("#hqno").val($(this).attr("href"));
			$("#f1").attr("action", "/qna/qview").attr("method", "get").submit(); 

		});
		
		
		$(".prev").on("click", function(e) {
			e.preventDefault();
			$("#hpage").val($(this).attr("href"));
			$("#f1").attr("action", "/qna/list").submit();

		});
		
		$(".curr").on("click", function(e) {
			e.preventDefault();
			$("#hpage").val($(this).attr("href"));
			$("#f1").attr("action", "/qna/list").submit();

		});
		
		$(".next").on("click", function(e) {
			e.preventDefault();
			$("#hpage").val($(this).attr("href"));
			$("#f1").attr("action", "/qna/list").submit();

		});
		
	});
	</script>
	
	
	
	
<%@ include file="/WEB-INF/views/footer.jsp" %>