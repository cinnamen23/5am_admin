<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<%@ include file="/WEB-INF/views/header.jsp"%>

<link href="assets/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">
<div class="content-wrapper">
	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				
				<h4 class="header-line">등록 상점</h4>

			</div>

		</div>
		<div class="row">
			<div class="col-md-12"></div>
		</div>

		<div class="row">

			<div class="col-md-12 col-sm-12 col-xs-12">

				<div class="panel panel-warning">
					<div class="panel-heading panel">상점 목록</div>
					<div class="panel-body">
						<div class="table-responsive">
							<div id="dataTables-example_wrapper"
								class="dataTables_wrapper form-inline" role="grid">
								<div class="row">



									<div class="col-sm-100">
										<div id="dataTables-example_filter" class="dataTables_filter">
											<label>
												<form class="f1" method="get" action="/store/list">
													<input class="hopage" type="hidden" name="page" value="1">
													<select name="type" class="type">
														<option value="x" ${cri.type eq null?'selected':''}>---</option>
														<option value="i" ${cri.type eq 'i'?'selected':''}>상점ID</option>
														<option value="n" ${cri.type eq 'n'?'selected':''}>상점
															이름</option>
														<option value="a" ${cri.type eq 'a'?'selected':''}>주소</option>
														<option value="g" ${cri.type eq 'g'?'selected':''}>전화번호</option>
														<option value="d" ${cri.type eq 'd'?'selected':''}>이메일</option>
													</select> <input type="search" class="form-control input-sm"
														aria-controls="dataTables-example" name="keyword"
														value="${cri.keyword}">

													<button id="btnn" class="btn btn-warning">Search</button>
												</form>
											</label>
										</div>
									</div>
								</div>
								<table
									class="table table-striped table-bordered table-hover dataTable no-footer"
									id="dataTables-example"
									aria-describedby="dataTables-example_info">
									<thead>
										<tr role="row">
											<th class="sorting_asc" tabindex="0"
												aria-controls="dataTables-example" rowspan="1" colspan="1"
												aria-label="Rendering engine: activate to sort column ascending"
												aria-sort="ascending" style="width: 70px;">상점ID</th>
											<th class="sorting" tabindex="0"
												aria-controls="dataTables-example" rowspan="1" colspan="1"
												aria-label="Browser: activate to sort column ascending"
												style="width: 40px;">상점 이름</th>
											<th class="sorting" tabindex="0"
												aria-controls="dataTables-example" rowspan="1" colspan="1"
												aria-label="Platform(s): activate to sort column ascending"
												style="width: 500px;">주소</th>
											<th class="sorting" tabindex="0"
												aria-controls="dataTables-example" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending"
												style="width: 100px;">전화번호</th>
											<th class="sorting" tabindex="0"
												aria-controls="dataTables-example" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending"
												style="width: 100px;">이메일</th>
											<th class="sorting" tabindex="0"
												aria-controls="dataTables-example" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending"
												style="width: 100px;">등록날짜</th>
											<th class="sorting" tabindex="0"
												aria-controls="dataTables-example" rowspan="1" colspan="1"
												aria-label="Engine version: activate to sort column ascending"
												style="width: 100px;">최근수정날짜</th>
											<th class="sorting" tabindex="0"
												aria-controls="dataTables-example" rowspan="1" colspan="1"
												aria-label="CSS grade: activate to sort column ascending"
												style="width: 40px;">관리</th>
										</tr>

									</thead>
									<tbody>

										<c:forEach var="list" items="${list}">
											<tr class="gradeA odd" id="membertable">
												<td class="sorting_1">${list.sid}</td>
												<td class="center ">${list.sname}</td>
												<td class="center ""font-size: 11px;">${list.saddrm}${list.saddr}</td>
												<td class="center ">${list.sphone}</td>
												<td class="center " style=>${list.semail}</td>
												<td class="center "><fmt:formatDate
														value="${list.regdate}" pattern="yyyy-MM-dd HH:mm" /></td>
												<td class="center "><fmt:formatDate
														value="${list.updatedate}" pattern="yyyy-MM-dd HH:mm" /></td>
												<td class="center" data-sname="${list.sname}"
													data-sphone="${list.sphone}" data-semail="${list.semail}"
													data-sid="${list.sid}" data-spw="${list.spw}"
													data-saddr="${list.saddr}" data-saddrm="${list.saddrm}">
													<a class="storemodi" href=""><i class="glyphicon glyphicon-wrench"></i></a> 
													<a class="storedel" href=""><i class="glyphicon glyphicon-remove"></i></a>
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

		</div>

	</div>

</div>

<form class="form" method="get" action="/store/list">
				<input class="hpage" type="hidden" name="page" value="${pageMaker.current}">
				<input class="htype" type="hidden" name="type" value="${cri.type}">
				<input class="hkeyword" type="hidden" name="keyword" value="${cri.keyword}">
				<input type="hidden" id="dsid" name="sid" value="">
 			</form>



<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
	$(document).ready(function(e) {

		var result = '${msg}';
		if (result == "success") {
			history.pushState(null, null);
			alert("작업이 완료 되었습니다.");
			window.onpopstate = function(e) {
				history.go(1);
			};
		}

		$(".pagination .a1").on("click", function(e) {
			
			e.preventDefault();
		
			$(".hpage").val($(this).attr("href"));
		
			$(".form").submit();
		})

		$(".storemodi").on("click", function(e) {
			
			e.preventDefault();
			console.log("상점 수정 중 ??")
			console.dir(this);
			console.log($(this).parent());

			var pass = $(this).parent();
			var passsid = pass.attr("data-sid");
			console.log(passsid);
			$("#dsid").val(passsid);
			var formObj = $(".form");

			formObj.attr('action', '/store/modi');
			formObj.attr('method', 'get');
			formObj.submit();	
		})

		

		$(".storedel").on("click", function(e) {
			e.preventDefault();
			if (confirm("정말 삭제하시겠습니까??") == true) {
				console.log("delete......");

				var pass = $(this).parent();
				var passsid = pass.attr("data-sid");
				$("#dsid ").val(passsid);

				var formObj = $(".form");

				formObj.attr('action', '/store/del');
				formObj.attr('method', 'post');
				formObj.submit();
			} else {
				return;
			}

		})
		
		

	})
</script>




<%@ include file="/WEB-INF/views/footer.jsp"%>