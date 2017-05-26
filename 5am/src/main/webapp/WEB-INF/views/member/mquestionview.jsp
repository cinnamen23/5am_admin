<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

    <%@ include file="/WEB-INF/views/header.jsp" %>
 

<link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">고객 질문/답변</h4>
					
				</div>

			</div>
			
				<div class="col-md-12">
				
				<div class="row">
					<div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-warning">
                        <div class="panel-heading panel">고객 질문 : ${vo.title}
                 
                        <p style="float: right; font: 8px;">작성자: ${vo.mid}</p>
                        
                        </div>
                        <div class="col-md-12">
                        <p style="float: right; font-size:12px; ">최초 등록 날짜: ${vo.regdate}</p>
                        </div>
                        <div class="col-md-12">
                        <p style="float: right; font-size:12px; ">최종 수정 날짜: ${vo.updatedate}</p>
                        </div>
                        <div class="panel-body" >
                        
                            <div class="table-responsive">
                            
                                 <div class="col-md-12 col-sm-12 col-xs-12" style="margin: auto;" >
                 			    <div>
                                  <p style="line-height:100%; letter-spacing: 2px; margin: auto" >  ${vo.question}</p>
                                 </div>   
                                  <div style="height: 50px">
                                  </div>
                             
                             <form action="/member/mquestiondel" method="post" id="deleteForm">
	                             <input type="hidden" name="mqno" value="${vo.mqno}">
	                             <button class="btn btn-warning" id="deleteBtn" style="float: right;" >삭제</button>   
                             </form>
                                  
                            <form action="/member/list" method="get">
	                             <input type="hidden" name="page" value="${cri.page}">
	                             <input type="hidden" name="type" value="${cri.type}">
	                             <input type="hidden" name="keyword" value="${cri.keyword}">
	                             <input type="hidden" name="page2" value="${cri2.page2}">
	                             <input type="hidden" name="type2" value="${cri2.type2}">
	                             <input type="hidden" name="keyword2" value="${cri2.keyword2}">
	                             <button type="submit" class="btn btn-warning" style="float: right;">목록 보기</button> 
                            </form>
                            
                             </div>
                                                                                          
                                </div>
                        
                                </div>
                                 
                          
                            </div>
                          </div>   
                      
                </div>
                
                <c:forEach var="list" items="${avo}">
                <div class="row">
	                <div class="col-md-12" >
	                    <div class="panel panel-warning">
	                    
	                        <div class="panel-heading panel" >판매자 답변 : ${list.title} 
	                        <p style="float: right; font: 8px">작성자: ${list.sid}</p>
	                        </div>
	                        <div class="col-md-12" >
	                        <h7 style="float: right; font-size:12px;">최초 등록 날짜: ${list.regdate}</h7>
	                        </div>
	                        <div class="col-md-12" >
	                        <h7 style="float: right; font-size:12px;">최종 수정 날짜: ${list.updatedate}</h7>
	                        </div>
	                        <div class="panel-body" >
	                        <h5>${list.content} </h5>
	                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin: auto;" >
	                        
	                        <a class="manswerdel" href="" data-mano="${list.mano}" style="float: right;"><i class="glyphicon glyphicon-trash"></i></a>      
	                        <a class="manswermodi" href="" data-toggle="modal" data-target="#exampleModal" 
                            data-mano="${list.mano}" data-title="${list.title}" data-content="${list.content}" style="float: right; margin-right:10px;"><i class="glyphicon glyphicon-wrench"></i></a>      
                             </div>
	                        
	                        </div>
	                        
	                  </div>
	                   
	                 </div>
	             </div>
	             </c:forEach>
	             <div class="row">
	                <div class="col-md-12" >
	                
	                <div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-primary">
						 <div class="panel-heading panel" style="margin-bottom: 0px;">답변을 등록합니다.</div>
						<div class="panel-body">
							
							<form role="form" class="fmar" >
								<div class="form-group">
									<label>제목</label> 
									<input class="form-control ltitle" type="text " name="title" placeholder="답변의 제목을 써주세요">
									
								</div>
								<div class="form-group">
									<label>답변 내용</label>
									<textarea class="form-control lcontent" rows="7" name="content" placeholder="질문에 대한 답변을 적어 주세요."></textarea>
								</div>
								<input type="hidden" name="mqno" value="${vo.mqno}">
																
                                <a id="manswerregi" href="#" class="btn btn-primary" style="float: right;">등록</a>
							</form>
						
						</div>
					</div>
				</div>
			</div> 
	                    </div>
	                    
	                </div>
	                
	             </div>
	             
	             
			</div>
		</div>
	
	<!--modal begin  -->
	<div class="panel panel-default">
	
		
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		     
		     
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">답변 수정
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button></h5>
		      </div>
		      
		      
		      <div class="modal-body">
		      
		        <form class="manswermodiform">
			        <div class="form-group">
			        <label for="recipient-name" class="form-control-label">고객질문 내용</label>
			        <p>${vo.question}</p>			        
			        </div>
		        
		        	<div class="form-group">
		            <label for="recipient-name" class="form-control-label">답변 제목</label>
		            <input type="text" class="form-control" id="title" name="title" value="">
		          	</div>
		          	
		          	<div class="form-group">
		            <label for="recipient-name" class="form-control-label">답변내용 </label>
		            <textarea id="content" class="form-control" name="content" rows="4" ></textarea>		            
		          	</div>
		        
			        <input type="hidden" id="mqno" name="mqno" value="${vo.mqno}">
			        <input type="hidden" id="mano" name="mano">
			        <input type="hidden" id="mid" name="page" value="${cri.page}">
			        <input type="hidden" id="mid" name="page2" value="${cri2.page2}">
			        <input type="hidden" id="mid" name="type" value="${cri.type}">
			        <input type="hidden" id="mid" name="type2" value="${cri2.type2}">
			        <input type="hidden" id="mid" name="keyword" value="${cri.keyword}">
			        <input type="hidden" id="mid" name="keyword2" value="${cri2.keyword2}">
			    </form>	          
		        
		       </div>
		      
		      <div class="modal-footer">
		        <button  id="modifyBtn" type="button" class="btn btn-secondary" data-dismiss="modal">등록</button>
		        <button  type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
		      </div>
		      
		    </div>
		  </div>
		</div>
	</div>
	<!-- modal end -->
	
	<form action="/member/manswerdel" method="post" class="manswerdelform">
	    <input type="hidden" name="mano" value="${list.mano}">
	</form>
	
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
<script>
$(document).ready(function(e) {
	
		$("#modifyBtn").on("click", function(e) {
			
			e.preventDefault();
			console.log("버튼 실행 ????");
		 
			var formObj = $(".manswermodiform");
			
			formObj.attr('action','/member/manswermodi');
			formObj.attr('method','get');
			formObj.submit();
		})	
	
		$(".manswermodi").on("click",function(e){
				e.preventDefault();
				console.log("수정......");
				console.log($(this));
				
				var passmano = $(this).attr("data-mano");
				var passtitle = $(this).attr("data-title");
				var passcontent = $(this).attr("data-content");
				
				console.log(passmano);
				
				$("#mano").val(passmano);
				$("#title").val(passtitle);
				$("#content").val(passcontent);
				
				
			})
		
		$(".manswerdel").on("click",function(e){
				e.preventDefault();
				console.log("answer delete")
				console.log($(this));
				
				var passmano = $(this).attr("data-mano");
				console.log(passmano);
				$("#mano").val(passmano);
				var formObj = $(".manswermodiform");
				
									
				formObj.attr('action','/member/manswerdel');
				formObj.attr('method','get');
				formObj.submit();
					
			})
		
		$("#manswerregi").on("click",function(e){
				e.preventDefault();
				console.log("answer register")
				console.log($(this));
				
				var formObj = $(".fmar");
				
				formObj.attr('action','/member/manswerregi');
				formObj.attr('method','get');
				formObj.submit();
				
		})
	
})
</script>	
<%@ include file="/WEB-INF/views/footer.jsp" %>