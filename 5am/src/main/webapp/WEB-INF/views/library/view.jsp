<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<%@ include file="/WEB-INF/views/header.jsp"%>

<link href="assets/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet">

<div class="content-wrapper">
<div class="content-wrapper">
		<div class="container">
			<div class="row pad-botm">
				<div class="col-md-12">
					<h4 class="header-line"><a href="/library/list">자료를 다운 받는 자료실입니다</a></h4>
					
				</div>

			</div>
			<div class="row">
				<div class="col-md-12">
				
				<div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-primary">
                        <div class="panel-heading panel"><h3><${lib.lno}> ${lib.ltitle } </h3> </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                <div class="col-md-12">
                                <div class="dataTables_length" id="dataTables-example_length">
                                <label>
                                
                                </div></div>
                                <div class="col-md-12">
                                <h4>등록일</h4>${lib.regdate}
                                <h4>수정일</h4>${lib.updatedate}
                               
	                                <div id="dataTables-example_filter" class="dataTables_filter">
	
	
			                            <div class="panel-body">
			                            <h3><strong>다운로드 파일</strong></h3>
			                            <div class="alert alert-info">
			                                <h3>${lib.lcontent} <br></h3>
			                                <a href="#" class="alert-link">${lib.lfile}<br></a>
			                                
			                            	파일을 다운 받으려면 위의 링크를 클릭하세요
			                            </div>
			                           <br>
			                             
			
			                           </div>
	                                </div>
                                </div>
                                </div>
                                <div class="row">
                                <div class="col-md-12">
                                <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">
                                <a href="#" class="btn btn-primary">수정</a>
                                <a href="#" class="btn btn-danger">삭제</a></div>
                                </div>
                                <div class="col-md-12">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                
                                
                                </div>

                                </div>
                                </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                                <a href="#" style="margin:10px" class="btn btn-success">목록</a>
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

</script>
<%@ include file="/WEB-INF/views/footer.jsp"%>