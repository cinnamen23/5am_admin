<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/header.jsp"%>

<style>
.file_input label {
    position:relative;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    width:100px;
    height:30px;
    background:#777;
    color:#fff;
    text-align:center;
    line-height:30px;
}
.file_input label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
.file_input input[type=text] {
    vertical-align:middle;
    display:inline-block;
    width:400px;
    height:28px;
    line-height:28px;
    font-size:11px;
    padding:0;
    border:0;
    border:1px solid #777;
}



</style>


   <!-- MENU SECTION END-->
  	<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line">질문 등록</h4>

				</div>

			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="panel panel-success">
						<div class="panel-heading">질문 등록</div>
						<div class="panel-body">
							
							<form id="f1" role="form" class="regiform" method="post" action="/qna/regi" enctype="multipart/form-data">
								<div class="form-group">
									<label>제목</label> <input class="form-control"
										id="qtitle" type="text" name="title" value="궁금한 사항을 작성해주세요" onfocus="this.value=''"/>
									
								</div>
								<div class="form-group">
									<label>내용</label>
									<textarea class="form-control" id="qcontent" rows="12" name="content"  onfocus="this.value=''">내용을 작성해주세요</textarea>
								</div>
								<div class="form-group">
									<label>글쓴이</label> <input class="form-control"
										id="qwriter" type="text" name="writer" value="작성자를 작성해주세요" onfocus="this.value=''"/>
									
								</div>
								

								<div class="file_input">
								    <label>
								        File Attach
								        <input id="file" type="file" name="file" multiple="multiple">
								    </label>
								    <input type="text" readonly="readonly" title="File Route">
								</div>
								<div id="uploadPreview">
								
								</div>


								
								
							<button id="qregibtn" class="btn btn-success">등록</button>
							<button class="btn btn-success"><a href="/qna/list" style="color: white">취소</a></button>
							</form>
			
						</div>
					</div>
				</div>
				
			</div>
			
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>


$(document).ready(function(e) {
	
	
	
	var result = '${fail}';
	if (result == 'fail') {
		
		alert("빈칸을 채워주세요")
	}
	
	function readImage(file) {
	    var reader = new FileReader();
	    var image  = new Image();
	    reader.readAsDataURL(file);  
	    reader.onload = function(_file) {
	        image.src    = _file.target.result;              // url.createObjectURL(file);
	        image.onload = function() {
	            var w = this.width,
	                h = this.height,
	                t = file.type,                           // ext only: // file.type.split('/')[1],
	                n = file.name,
	                s = ~~(file.size/1024) +'KB';
	            if(w > 10000 || h >5000){
	                alert("1000*500px 이하로 맞춰주세요(비율2:1)");
	                $("#file").val("");
	                
	            }else{
	                  $('#uploadPreview').append('<img src="'+ this.src +'" width="200" height="100">');  
	            }
	          
	        };
	        image.onerror= function() {
	            alert('해당형식은 지원하지 않습니다. 파일형식:JPG,PNG');
	            $("#file").val("");
	        };      
	    };
	}
	
	

	$('#qregibtn').on("click", function(e) {
			e.preventDefault();	

			console.log("들어왔으 ");
			console.log($('#qtitle').val());				
			if ($('#qtitle').val().length == 0) {
				alert("제목을 입력해주세요....");
			}else if($('#qcontent').val().length == 0){
				alert("내용을 입력해주세요....");
			}else if($('#qwriter').val().length == 0){
				alert("작성자를 입력해주세요....");
			}else{
				$('#f1').submit();
			}
		
	});
	
	
	/* 멀티파트처리 하는거  */
	$('.file_input input[type=file]').change(function() {
	    var fileName = $(this).val();
	    var fileCount = $(this).get(0).files.length;
	    if($(this).get(0).files.length == 1){
	        $('.file_input input[type=text]').val(fileName);
	    }
	    else {
	        $('.file_input input[type=text]').val('파일 '+fileCount+'개');
	    }
	}); 


	$("#file").change(function (e) {
		
		$("#uploadPreview img").remove();
		
	    if(this.disabled) return alert('File upload not supported!');
	    console.log(this.files);
	    var F = this.files;
	    if(F && F[0]) for(var i=0; i<F.length; i++) readImage( F[i] );
	});  
	
	


});

            
 </script>      



<%@ include file="/WEB-INF/views/footer.jsp"%>