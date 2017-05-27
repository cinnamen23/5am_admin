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
						<div class="panel-heading">공지사항 등록</div>
						<div class="panel-body">
							<form role="form" method="post" action="/notice/regi" class="regiform" enctype="multipart/form-data">
								<div class="form-group">
									<label>제목</label> <input class="form-control"
										type="text" name="ntitle" value="공지사항 제목을 작성해주세요" />
									
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" rows="12" name="ncontent">내용을 작성해주세요</textarea>
								</div>
								<div class="form-group">
									<label>글쓴이</label> <input class="form-control"
										type="text" name="nwriter" value="작성자를 작성해주세요"/>
									
								</div>
								
								<div class="form-group">
									<label>이미지 첨부파일</label> 
									<input class="form-control" type="file" name="nimage"/>
									
								</div>
								


								
							<button type="submit" class="btn btn-info" id="regi">등록</button>
							<button class="btn btn-info"><a href="/notice/list">취소</a></button>
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
	
	var result = '${fail}';
	if (result == 'fail') {
		
		alert("빈칸을 채워주세요")
	}
	
	$("#regi").on("click",function(e){
		
		var result3 = '${msg}';
		if (result3 == "success") {
			history.pushState(null, null);
			alert("새글이 등록되었습니다.");
			window.onpopstate = function(e) {
				history.go(1);
			};
		}
	})
	

	
	
	
})

            
 </script>          

    

<%@ include file="/WEB-INF/views/footer.jsp" %>