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
					<h4 class="header-line">등록 회원</h4>
					${login }
				</div>

			</div>
			<div class="row">
				<div class="col-md-12">
				
		
		</div>
	</div>
	
	<div class="row">
                 
                 <div class="col-md-8 col-sm-8 col-xs-12">
                     
                     <div class="panel panel-warning">
                        <div class="panel-heading panel">회원 목록  </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                
                              
                                
                                <div class="col-sm-100">
                                <div id="dataTables-example_filter" class="dataTables_filter">
                         <label>
				              <form class="f1" method="get" action="/member/list">
								<input class="hopage" type="hidden" name="page" value="1"> 
					                <select name="type" class="type">
									<option value="x" ${cri.type eq null?'selected':''}>---</option>
									<option value="i" ${cri.type eq 'i'?'selected':''}>회원ID</option>
									<option value="n" ${cri.type eq 'n'?'selected':''}>이름</option>
									<option value="a" ${cri.type eq 'a'?'selected':''}>나이</option>
									<option value="g" ${cri.type eq 'g'?'selected':''}>성별</option>
									<option value="d" ${cri.type eq 'd'?'selected':''}>주소</option>
								    </select> 
							    <input type="search" class="form-control input-sm" aria-controls="dataTables-example" name="keyword" value="${cri.keyword}">
							    
							    <button id="btnn" class="btn btn-warning">Search</button>
							  </form>
						</label>
                                </div>
                                </div>
                                </div>
                                <table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                    <thead>
                                        <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" aria-sort="ascending" style="width: 70px;">회원ID</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 40px;">이름</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 40px;">나이</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 40px;">성별</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 300px;">주소</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 100px;">등록날짜</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 100px;">최근수정날짜</th>
                                    	<th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 40px;">관리</th></tr>
                                    	
                                    </thead>
                                    <tbody>
                                        
                                     <c:forEach var="list" items="${list}">
                                    <tr class="gradeA odd" id="membertable">
                                            <td class="sorting_1">${list.mid}</td>
                                            <td class="center " >${list.mname}</td>
                                            <td class="center ">${list.mage}</td>
                                            <td class="center ">${list.mgender}</td>
                                            <td class="center " style="font-size: 11px;">${list.maddr}</td>
                                            <td class="center ">${list.regdate}</td>
                                            <td class="center ">${list.updatedate}</td>
                                            <td class="center" data-mname="${list.mname}" data-mage="${list.mage}" data-mgender="${list.mgender}" data-mid="${list.mid}" data-maddr="${list.maddr}">
                                            <a class="membermodi" href="" data-toggle="modal" data-target="#exampleModal"><i class="glyphicon glyphicon-wrench"></i></a>
                                            <a class="memberdel" href=""><i class="glyphicon glyphicon-remove"></i></a>
                                            </td>
                                            
                                         
                                        </tr>
                                        </c:forEach>   
                                        </tbody>
                                </table>
                            
                                <div class="row">
                                <div class="col-sm-6">
                                </div>
                                <div class="col-sm-12">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                <ul class="pagination">
                                <li class="paginate_button" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
                                <c:if test="${pageMaker.prev}"><a class="a1" href="${pageMaker.start-1}">&laquo;</a></c:if></li>
                                <c:forEach begin="${pageMaker.start}" end="${pageMaker.end}" var="pagege">
                                <a class="a1" href="${pagege}">
			                 	<li class="${pageMaker.current ==pagege?'active':''}" aria-controls="dataTables-example" tabindex="0">${pagege}</a></li>
			                 	</c:forEach> 
                                <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
                                <c:if test="${pageMaker.next}"><a class="a1" href="${pageMaker.end+1}">&raquo;</a></c:if></li>
                                </ul>
                                </div>
                           		</div>
                                </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                     
                     
                     
                 </div>
                 <div class="col-md-4 col-sm-4 col-xs-12" >
                         <div class="alert alert-info text-center">
                          <h3> 현재 로그인 된 사용자</h3> 
                          <hr />
                          <p>
                         ${login.sid }</br>
                         ${login.sname }</br>
                         ${login.saddr }</br>
                         ${login.sphone }</br>
                         ${login.semail }</br>
                         
                        </p>
                          <hr />
                           <a href="#" class="btn btn-info">정보 수정</a> 
                        </div>
                 </div>
             </div>
             
             <div class="row">
             <div class="col-md-12">
            
            
            <div class="panel panel-warning">
                        <div class="panel-heading panel">고객 질문 현황 </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                <div class="col-sm-6">
                                <div class="dataTables_length" id="dataTables-example_length">
                                </div>
                                </div>
                                <div class="col-sm-6">
                                <div id="dataTables-example_filter" class="dataTables_filter">
                          <label>
				              <form class="f1" method="get" action="/member/list">
								<input class="hopage" type="hidden" name="page2"value="1"> 
				                <select name="type2" class="type">
									<option value="x" ${cri2.type2 eq null?'selected':''}>---</option>
									<option value="i" ${cri2.type2 eq 'i'?'selected':''}>ID</option>
									<option value="t" ${cri2.type2 eq 't'?'selected':''}>제목</option>
									<option value="c" ${cri2.type2 eq 'c'?'selected':''}>내용</option>
								</select> 
							    <input type="search" class="form-control input-sm" aria-controls="dataTables-example" name="keyword2" value="${cri2.keyword2}">
							    <button id="btnn" class="btn btn-warning">Search</button>
							  </form>
						</label>
                                </div>
                                </div>
                                </div>
                                <table class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                    <thead>
                                     <tr role="row">
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Browser: activate to sort column ascending" style="width: 5px;">#</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 30px;">id</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 400px;">제목</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 100px;">등록날짜</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 100px;">최근수정날짜</th>
                                        <th class="sorting" tabindex="0" aria-controls="dataTables-example" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 50px;">답변 갯수</th>
                                        
                                     </tr>
                                    </thead>
                                  <tbody>
                                        
                                     <c:forEach var="qlist" items="${qlist}">
	                                    <tr class="gradeA odd">
	                                            <td class="sorting_1">${qlist.mqno}</td>
	                                            <td class="center ">${qlist.mid}</td>
	                                            <td class="center "><a class="qtitle" href="${qlist.mqno}">${qlist.title}</a></td>
	                                            <td class="center ">${qlist.regdate}</td>
	                                            <td class="center ">${qlist.updatedate}</td>
	                                            <td class="center ">${qlist.checked}</td>
	                                    </tr>
                                     </c:forEach>   
                                  </tbody>
                                </table>
                            
                                <div class="row">
                                <div class="col-sm-6">
                                </div>
                                <div class="col-sm-6">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                <ul class="pagination">
                                <li class="paginate_button" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous">
                                <c:if test="${pageMaker2.prev}"><a class="a2" href="${pageMaker2.start-1}">이전</a></c:if></li>
                                <c:forEach begin="${pageMaker2.start}" end="${pageMaker2.end}" var="pagege">
                                <a class="a2" href="${pagege}">
			                 	<li class="${pageMaker2.current ==pagege?'active':''}" aria-controls="dataTables-example" tabindex="0">${pagege}</a></li>
			                 	</c:forEach> 
                                <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
                                <c:if test="${pageMaker2.next}"><a class="a2" href="${pageMaker2.end+1}">다음</a></c:if></li>
                                </ul>
                                </div>
                           		</div>
                                </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
             
             	</div>
             </div>
       
	<!-- CONTENT-WRAPPER SECTION END-->
	</div>
	
	<!-- 모달창1 시작-->
		<div class="panel panel-default">
		
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		     
		     
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">회원 정보 변경  ${cri}
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button></h5>
		      </div>
		      
		      
		      <div class="modal-body">
		        <form class="fm">
		        	<div class="form-group">
		            <label for="recipient-name" class="form-control-label">비밀번호 </label>
		            <input type="text" class="form-control" id="mpw" name="mpw" value="비밀번호를 입력하세요.">
		          </div>
		          <div class="form-group">
		            <label for="recipient-name" class="form-control-label">이름 </label>
		            <input type="text" class="form-control" id="mname" name="mname" value="">
		          </div>
		          <div class="form-group">
		            <label for="message-text" class="form-control-label">나이</label>
		            <input type="text" class="form-control" id="mage" name="mage" value="">
		          </div>
		          <div class="form-group">
		            <div class="form-group">
								<label>성별</label> <select id="mgender" name="mgender" class="form-control">
									<option value="m">남자</option>
									<option value="w">여자</option>
									
								</select>
							</div>
		          </div>
		          <div class="form-group">
		            <label for="message-text" class="form-control-label">주소</label>
		            <input type="text"class="form-control" id="maddr" name="maddr" value="">
		          </div>
		         <input type="hidden" id="mid" name="mid" value="">
		         <input type="hidden" id="mid" name="page" value="${cri.page}">
		         <input type="hidden" id="mid" name="page2" value="${cri2.page2}">
		         <input type="hidden" id="mid" name="type" value="${cri.type}">
		         <input type="hidden" id="mid" name="type2" value="${cri2.type2}">
		         <input type="hidden" id="mid" name="keyword" value="${cri.keyword}">
		         <input type="hidden" id="mid" name="keyword2" value="${cri2.keyword2}">
		         
		        </form>
		       </div>
		        
		      </div>
		      <div class="modal-footer">
		        <button  id="modifyBtn" type="button" class="btn btn-secondary" data-dismiss="modal">수정</button>
		        <button  type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- 모달창1 끝-->
		</div>
		
			<form class="form" method="get" action="/member/list">
				<input class="hpage" type="hidden" name="page" value="${pageMaker.current}">
				<input class="hpage2" type="hidden" name="page2" value="${pageMaker2.current}">
				<input class="hmqno" type="hidden" name="mqno" value="">
				<input class="htype" type="hidden" name="type" value="${cri.type}">
				<input class="hkeyword" type="hidden" name="keyword" value="${cri.keyword}">
				<input class="htype2" type="hidden" name="type2" value="${cri2.type2}">
				<input class="hkeyword2" type="hidden" name="keyword2" value="${cri2.keyword2}">
 			</form>
 			
 			<form class="fd">
 				<input type="hidden" id="dmid" name="mid" value="">
 			</form>
	
	<script  src="https://code.jquery.com/jquery-3.2.1.min.js"
  			integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

	<script>
	$(document).ready(function(e) { 
	
		$(".pagination .a1").on("click", function(e) {
		
			e.preventDefault();
		
			$(".hpage").val($(this).attr("href"));
		
			$(".form").submit();
		})
		
		$(".pagination .a2").on("click", function(e) {
		
			e.preventDefault();
		
			$(".hpage2").val($(this).attr("href"));
		
			$(".form").submit();
		})
		
		$(".qtitle").on("click", function(e) {
		
			e.preventDefault();
		
			$(".hmqno").val($(this).attr("href"));
			 
			var formObj = $(".form");
			
			formObj.attr('action','/member/mquestionview');
			formObj.attr('method','get');
			formObj.submit();
		})
		
		$(".membermodi").on("click",function(e){
			e.preventDefault();
			console.log("수정......");
			console.dir(this);
			console.log($(this).parent());
			
			var pass =$(this).parent();
			var passmid = pass.attr("data-mid");
			var passmname = pass.attr("data-mname");
			var passmage = pass.attr("data-mage");
			var passmaddr = pass.attr("data-maddr");
			$("#mname").val(passmname);
			$("#mage").val(passmage);
			$("#mid").val(passmid);
			$("#maddr").val(passmaddr);
			
		})
		
		$("#modifyBtn").on("click", function(e) {
		
			e.preventDefault();
		 
			var formObj = $(".fm");
			
			formObj.attr('action','/member/modi');
			formObj.attr('method','post');
			formObj.submit();
		})
		
		$(".memberdel").on("click", function(e) {		
			
			e.preventDefault();
			console.log("delete......");
			
			var pass =$(this).parent();
			var passmid = pass.attr("data-mid");
			$("#dmid ").val(passmid);
		 
			var formObj = $(".fd");
			
			formObj.attr('action','/member/del');
			formObj.attr('method','post');
			formObj.submit();
		})
		
		
	
	})
	</script>	
<%@ include file="/WEB-INF/views/footer.jsp" %>