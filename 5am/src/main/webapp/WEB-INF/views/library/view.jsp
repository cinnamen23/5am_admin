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
				<h4 class="header-line">자료를 다운 받는 자료실입니다</h4>

			</div>

		</div>
		<div class="row">
			<div class="col-md-12">

				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-primary">
							<div class="panel-heading panel ">목록</div>
							<div class="panel-body">
								<div class="table-responsive">
									<div id="dataTables-example_wrapper"
										class="dataTables_wrapper form-inline" role="grid">
										<div class="row">
											<div class="col-sm-6">
												<div class="dataTables_length"
													id="dataTables-example_length">
						
												</div>
											</div>
											<div class="col-sm-6">
												<div id="dataTables-example_filter"
													class="dataTables_filter">
													<label>Search:<input type="search"
														class="form-control input-sm"
														aria-controls="dataTables-example"></label>
												</div>
											</div>
										</div>
										<table	class="table table-striped table-bordered table-hover dataTable no-footer"
											id="dataTables-example"
											aria-describedby="dataTables-example_info">
											<thead>
												<tr role="row">
													<th class="sorting_asc" style="width: 189px;">번호</th>
													<th class="sorting" style="width: 291px;">제목</th>
													<th class="sorting" style="width: 160px;">등록일</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="list">
													<tr class="gradeA odd">
														<td class="sorting_1">${list.lno}</td>
														<td class=" "><a href=${list.lno}>${list.ltitle}</a></td>
														<td class="center ">${list.regdate}</td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
										<div>${pageMaker}</div>
										<div>${cri}</div>
										<div class="row">
					
											<div class="col-sm-6">
												<div class="dataTables_paginate paging_simple_numbers"
													id="dataTables-example_paginate">
													<ul class="pagination">
														<li class="paginate_button"
															aria-controls="dataTables-example" tabindex="0"
															id="dataTables-example_previous"><c:if
																test="${pageMaker.prev}">
																<a href="${pageMaker.start-1}">이전</a>
															</c:if></li>
														<c:forEach begin="${pageMaker.start}"
															end="${pageMaker.end}" var="pagege">
																<li class="paginate_button"
																aria-controls="dataTables-example" tabindex="0"><a href="${pagege}">${pagege}</a></li>
															
														</c:forEach>
														<li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next">
															<c:if test="${pageMaker.next}">
																<a href="${pageMaker.end+1}">다음</a>
															</c:if></li>
													</ul>
												</div>
												<div>
													<form class="form" method="get" action="/notice/list">
														<input class="hopage" type="hidden" name="page"	value="${pageMaker.current}"> <input class="view"
															type="hidden" name="bno">
														<%-- <select name="type" class="type">
				<option value="n" ${cri.type eq null?'selected':''}>---</option>
				<option value="t" ${cri.type eq 't'?'selected':''}>title</option>
				<option value="c" ${cri.type eq 'c'?'selected':''}>content</option>
				<option value="w" ${cri.type eq 'w'?'selected':''}>writer</option>
			</select>  --%>
														<%-- <input type="text" class="text" name="keyword"
				value="${cri.keyword}"> --%>
														<!-- 	<button id="btnn" class="btn btn-info">Search</button> -->

													</form>
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
				<div class="alert alert-info">
					마구니 마구니 <br /> <a target="_blank"
						href="http://www.binarytheme.com/"></a>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- CONTENT-WRAPPER SECTION END-->
<script>
$(document).ready(function(e) {
	
	$(".")
	

$(".pagination a").on("click", function(e) {

	e.preventDefault();

	$(".hopage").val($(this).attr("href"));

	$(".form").submit();
})
})
</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>