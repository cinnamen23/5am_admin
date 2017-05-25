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
                        <p style="float: right; font-size:12px; ">최종수정시간: ${vo.updatedate}</p>
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
	                    
	                        <div class="panel-heading panel">판매자 답변 : ${list.title} 
	                        <p style="float: right; font: 8px">작성자: ${list.sid}</p>
	                        </div>
	                        <div class="col-md-12" >
	                        <h7 style="float: right; font-size:12px;">최종수정시간: ${list.updatedate}</h7>
	                        </div>
	                        <div class="panel-body" >
	                        <h5>${list.content} </h5>
	                        </div>
	                        
	                        	
	                     
	                    </div>
	                   
	                 </div>
	             </div>
	             </c:forEach>
	             <div class="row">
	                <div class="col-md-12" >
	                here for answer
	                    
	                    
	                    </div>
	                    
	                </div>
	                
	             </div>
	             
	             
			</div>
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
		}else{   
		    return;
		}


		
		
		
	})
	
})
</script>	
<%@ include file="/WEB-INF/views/footer.jsp" %>