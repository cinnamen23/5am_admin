<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

    <%@ include file="/WEB-INF/views/header.jsp" %>

     <!-- MENU SECTION END-->
  	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line"><a href="/notice/list">공지 사항</a></h4>

				</div>

			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-info">
						<div class="panel-heading">공지사항 수정</div>
						<div class="panel-body">
							<form role="form"  action="/notice/nview" class="updateForm" >
								<input type="hidden" name="page" value="${cri.page}">
                            	<input type="hidden" name="nno" value="${read.nno}">
                           		<input type="hidden" name="type" value="${cri.type}">
                            	<input type="hidden" name="keyword" value="${cri.keyword}">
                            	
								<div class="form-group">
									<label>제목</label> <input class="form-control"
										type="text" name="ntitle" value="${read.ntitle}" id="title" />
									
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="12" name="ncontent" id="content">${read.ncontent}</textarea>
								</div>
								<div class="form-group">
									<label>글쓴이</label> <input class="form-control"
										type="text" name="nwriter" value="${read.nwriter}"id="writer"/>
									
								</div>
								


								
							<button type="submit" class="btn btn-info" style="float: left; margin: 5px" id="btnRegi">등록</button>
							
							</form>
						
							
							<form action="/notice/nview" method="get">
							<input type="hidden" name="page" value="${cri.page}">
                            <input type="hidden" name="nno" value="${read.nno}">
                            <input type="hidden" name="type" value="${cri.type}">
                            <input type="hidden" name="keyword" value="${cri.keyword}">
							<button class="btn btn-info" style="float: left; margin: 5px">취소</button>
							</form>
							
							
						
						</div>
					</div>
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
	
	
		
		
		
	
	
	
	
})

            
 </script>          

    

<%@ include file="/WEB-INF/views/footer.jsp" %>