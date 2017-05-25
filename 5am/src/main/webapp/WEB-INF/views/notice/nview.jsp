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
					<h4 class="header-line">공지 사항</h4>
					
				</div>

			</div>
			<div class="row">
				<div class="col-md-12">
				
				<div class="row">
                <div class="col-md-12" >
                    <!-- Advanced Tables -->
                    <div class="panel panel-info">
                        <div class="panel-heading panel">${read.ntitle}
                        </div>
                        <div class="panel-body">
                        <p  style="float: right; font: 8px">${read.nwriter}</p>
                            <div class="table-responsive">
                                <div id="dataTables-example_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                <div class="col-sm-6" >
                                <div class="dataTables_length" id="dataTables-example_length">
                                <label>
                                
                                </div></div><div class="col-sm-6" ><div id="dataTables-example_filter" class="dataTables_filter">
                <label>
             
			    </label>
                               
                                </div></div></div>
                                <div class="table table-striped table-bordered table-hover dataTable no-footer" id="dataTables-example" aria-describedby="dataTables-example_info">
                                  
                                  <div class="col-md-6 col-sm-6 col-xs-6" >
                 
                         <div style="height: 100px">
                                  <p class="center " style="float: right;">${read.updatedate}</p>
                                 </div>
                        <div>
                                  <p>  ${read.ncontent}</p>
                                  </div>   
                            
                          
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
		</div>
	</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	</div>
	</div>
	<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function(e) {
	
	
})
</script>	
<%@ include file="/WEB-INF/views/footer.jsp" %>