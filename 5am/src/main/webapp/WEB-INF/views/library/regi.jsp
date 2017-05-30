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
                    
        	<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-primary">
						 <div class="panel-heading panel"><h3>파일을 등록합니다</h3> </div>
						<div class="panel-body">
							
							<form  method="post" action="/library/regi" class="form" enctype="multipart/form-data" name="form">
								<div class="form-group">
									<label>제목</label> 
									<input class="form-control ltitle" type="text " name="ltitle" value="자료의 제목을 작성해주세요 " onfocus="this.value=''">
									
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control lcontent" rows="7" name="lcontent" onfocus="this.value=''">업로드한 자료를 설명하는 내용을 길게 써보아요~ </textarea>
								</div>
								<div class="form-group">
									<label>파일</label>
									<input class="form-control lfile" type="file" name="file">
								</div>
								
                                <a href="#" class="btn btn-primary saveBtn">저장</a>
                                <a href="/library/list" class="btn btn-primary cancelBtn">취소</a>
							</form>
						
						
						
						
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

	 var $title= $(".ltitle");
	 var $content= $(".lcontent");
	 var $file=$(".lfile");
	 
	 
	
	
//저장, 빈칸방지
	$(".saveBtn").on("click", function(e){
		e.preventDefault();
		if($title.val()==""){
			 alert("제목을 입력해주세요");
		 }
		 
		 if($content.val()==""){
			 alert("내용을 입력해주세요");
		 }
		 
		 if($file.val()==""){
			 alert("업로드할 파일을 찾아주세요");
		 }
		 if($file.val()!="" && $content.val()!="" && $title.val()!=""){

			 $(".form").attr("method", "post").attr("action", "/library/regi").submit();
		     history.pushState(null, null,"/library/list");
			 alert("처리가 완료되었습니다.")

		     window.onpopstate = function(e){
		     history.go(1);}
			 }
		
		
	})

})
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>