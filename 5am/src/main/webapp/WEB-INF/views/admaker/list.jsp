<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<style>
    .submitLink {
    background-color: transparent;
    border: none;
	color:white;
    cursor: pointer;
    }
    </style>
    <%@ include file="/WEB-INF/views/header.jsp" %>
<link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet">
	<div class="content-wrapper" style=" margin-top:0px;">
		<div class="container">
			<div class="row pad-botm" style=" padding-bottom:0px;">
				<div class="col-md-12">
					<h3 class="header-line" ><a href="/admaker/list" style="color: black">5초 광고 만들기<small>5AM</small></a></h3>

				</div>

			</div>


								<!-- /.row -->
								<div class="col-md-12" style=" margin-bottom:15px;">
									<div class="col-md-6 col-sm-6">
									<div style= "padding:10px;">
										<button id="delete" class="btn btn-default">delete</button>
										<button id="reset" class=" btn btn-default">reset</button>
										<button id="deactive" class="btn btn-default">deactive</button>
										<button id="save-jpeg" class="btn btn-default">save-jpeg</button>
									</div>
									
										<canvas id="c" width="340" height="500"
											style="border: 1px solid #000000;"></canvas>
									</div>
									<!-- /.end col-md-6 row -->


										<!-- Nav tabs -->
									<div style="margin-bottom:1px;" class="col-md-6 col-sm-6">
										<ul class="nav nav-tabs " role="tablist" style="padding:5px">
											<li role="presentation" class="active"><a href="#home"
												aria-controls="home" role="tab" data-toggle="tab">사진추가</a></li>
											<li role="presentation"><a href="#profile"
												aria-controls="profile" role="tab" data-toggle="tab">문구추가</a></li>
											<li role="presentation"><a href="#messages"
												aria-controls="messages" role="tab" data-toggle="tab">스티커추가</a></li>
											<li role="presentation"><a href="#settings"
												aria-controls="settings" role="tab" data-toggle="tab">변환</a></li>
										</ul>
				
										<!-- Tab panes -->
										<div class="tab-content ">
											<!-- 1번째 -->
											<div role="tabpanel" class="tab-pane active" id="home">
												<h3>편집할 사진을 찾아주세요</h3>
												<div>

													<form id="form1" runat="server">
														<input type='file' id="imgInp"/> 
														<img id="blah" src="#" alt="your image" style="height:auto; width:auto;" />
													</form>
												<button id="confirm">confirm</button>
												<form id="uploadImg" runat="server">
												  <input type="file" id="uploadedImg"/>
												</form>
												</div>
											</div>

											<!-- 2번째 -->
											<div role="tabpanel" class="tab-pane" id="profile">
												
												<button id="addtext">addText</button>
												<p>
												  <button id="bold">Bold</button>
												  <button id="italic">Italic</button>
												  <button id="underline">Underline</button>
												  <input type="color" id="color">
												  <input type="color" id="text-bg-color">
												  <input type="range" min="5" max="150" value="40" id="text-font-size">
												  <label for="font-family" style="display:inline-block">Font family:</label>
												  <select id="font-family">
												        <option value="arial">Arial</option>
												        <option value="helvetica" selected>Helvetica</option>
												        <option value="myriad pro">Myriad Pro</option>
												        <option value="delicious">Delicious</option>
												        <option value="verdana">Verdana</option>
												        <option value="georgia">Georgia</option>
												        <option value="courier">Courier</option>
												        <option value="comic sans ms">Comic Sans MS</option>
												        <option value="impact">Impact</option>
												        <option value="monaco">Monaco</option>
												        <option value="optima">Optima</option>
												        <option value="hoefler text">Hoefler Text</option>
												        <option value="plaster">Plaster</option>
												        <option value="engagement">Engagement</option>
												  </select>
												    
												     
												     
												</p>
											</div>
											
											<div role="tabpanel" class="tab-pane" id="messages">...</div>
											
											<div role="tabpanel" class="tab-pane" id="settings">
												<div id="d2">
											        <img id="img1" src="" style="width: 80% ;height:auto;">
											        <button id="down">down</button>
											        <button id="start">start</button>
												</div>
											</div>
										</div>

									</div>
									<!--End Nav tabs -->

									<!-- 미리보기 사진목록 -->
									<div class='uploadedList2 col-md-12' style=" padding:30px;">
									</div>


         			</div>

			
		</div>
	<!-- CONTENT-WRAPPER SECTION END-->
	
	
	
	
	
	
    <iframe id="rufous-sandbox" scrolling="no" frameborder="0"
        allowtransparency="true" allowfullscreen="true"
        title="Twitter analytics iframe"
        style="position: absolute; visibility: hidden; display: none; width: 0px; height: 0px; padding: 0px; border: none;"></iframe>
	<script src='../resources/gifshot.js'></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/1.7.11/fabric.min.js"></script>
<script>
	
$(document).ready(function(){
	
	  var i= 0;
	  var bg="";
	  var iscr = new Array();
	  var canvas = this.__canvas = new fabric.Canvas('c');
      fabric.Object.prototype.transparentCorners = false; 
	  
	  (function() {
        

        var rect1 = new fabric.Rect({
            width: 200, height: 100, left: 0, top: 50, angle: 30,
            fill: 'rgba(255,0,0,0.5)'
        });

        var rect2 = new fabric.Rect({
            width: 100, height: 100, left: 350, top: 250, angle: -10,
            fill: 'rgba(0,200,0,0.5)'
        });

        var rect3 = new fabric.Rect({
            width: 50, height: 100, left: 275, top: 350, angle: 45,
            stroke: '#eee', strokeWidth: 10,
            fill: 'rgba(0,0,200,0.5)'
        });

        var circle = new fabric.Circle({
            radius: 50, left: 275, top: 75, fill: '#aac'
        });

        var triangle = new fabric.Triangle({
            width: 100, height: 100, left: 50, top: 300, fill: '#cca'
        });

        
        canvas.add(rect1, rect2, rect3, circle, triangle);
        canvas.on({
            'object:moving': onChange,
            'object:scaling': onChange,
            'object:rotating': onChange,
        });

        function onChange(options) {
            options.target.setCoords();
            canvas.forEachObject(function(obj) {
                if (obj === options.target) return;
           //     obj.setOpacity(options.target.intersectsWithObject(obj) ? 0.5 : 1);
            });
        }
        
    })();
	  
	  document.getElementById('uploadedImg').onchange = function handleImage(e) {
          var reader = new FileReader();
            reader.onload = function (event){
              var imgObj = new Image();
              imgObj.src = event.target.result;
              imgObj.onload = function () {
                var image = new fabric.Image(imgObj);
                image.set({
                      angle: 0,
                      cornersize:10,
                      height:110,
                      width:200,
                });
                canvas.centerObject(image);
                canvas.add(image);
                canvas.renderAll();
              }
            }
            reader.readAsDataURL(e.target.files[0]);
          }
    
    
    function setStyle(object, styleName, value) {
          if (object.setSelectionStyles && object.isEditing) {
              var style = { };
              style[styleName] = value;
              object.setSelectionStyles(style).setCoords();
          }
          else {
              object[styleName] = value;
          }
          canvas.renderAll();
      };
      function  getStyle(object, styleName) {
          return (object.getSelectionStyles && object.isEditing)
          ? object.getSelectionStyles()[styleName]
          : object[styleName];
      }
      function addHandler(id, fn, eventName) {
          document.getElementById(id)[eventName || 'onclick'] = function() {
              var el = this;
              if (obj = canvas.getActiveObject()) {
                  fn.call(el, obj);
                  canvas.renderAll();
              }
          };
      }  


      addHandler('underline', function(obj) {
        var isUnderline = (getStyle(obj, 'textDecoration') || '').indexOf('underline') > -1;
        setStyle(obj, 'textDecoration', isUnderline ? '' : 'underline');
      });
      
      addHandler('bold', function(obj) {
            var isBold = (getStyle(obj, 'fontWeight') || '').indexOf('bold') > -1;
            setStyle(obj, 'fontWeight', isBold ? '' : 'bold');
          });
      
      addHandler('italic', function(obj) {
            var isItalic = (getStyle(obj, 'fontStyle') || '').indexOf('italic') > -1;
            setStyle(obj, 'fontStyle', isItalic ? '' : 'italic');
          });
      
      addHandler('color', function(obj) {
            setStyle(obj, 'fill', this.value);
          },'onchange');
      
      addHandler('font-family', function(obj) {
            setStyle(obj, 'fontFamily', this.value);
          }, 'onchange');
      
      addHandler('text-bg-color', function(obj) {
            setStyle(obj, 'textBackgroundColor', this.value);
          }, 'onchange');
      addHandler('text-font-size', function(obj) {
            setStyle(obj, 'fontSize', this.value);
          }, 'onchange');
	  
	  
	function addtext(puttext){
		var text = new fabric.Text(puttext, { left: 100, top: 100 });
        canvas.add(text);
      		
	}
	
	function addtext2(){  
	       var iTextSample = new fabric.IText("input Text", {
	            left: 50,
	            top: 50,
	            fontFamily: 'Helvetica',
	            fill: '#333',
	            lineHeight: 1.1,
	            styles: {
	              0: {
	                0: { textDecoration: 'underline', fontSize: 80 },
	                1: { textBackgroundColor: 'red' }
	              },
	              1: {
	                0: { textBackgroundColor: 'rgba(0,255,0,0.5)' },
	                4: { fontSize: 20 }
	              }
	            }
	          });
	        canvas.add(iTextSample);
	        }
	  
    
	function backg(bg){
        
        var imgElement = document.getElementById(bg);
         console.log(imgElement);
       
          var imgInstance = new fabric.Image(imgElement, {
              left: 0,
              top: 0,
              
              opacity: 1
          });
          imgInstance.setWidth(canvas.width);
          imgInstance.setHeight(canvas.height);
          canvas.setBackgroundImage(imgInstance);
          canvas.renderAll();

    };
  
    
    
    $("#addtext").click(function(e){
        e.preventDefault();
          canvas.deactivateAll();
          canvas.renderAll()
      
         
         addtext2();
         canvas.renderAll();
          
     });
    
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

	$("#imgInp").change(function(){
        readURL(this);
    }); 
    
 	  $("#confirm").click(function(){
        backg("blah");
    }) 
    
$("#save-jpeg").click(function () {
        canvas.deactivateAllWithDispatch();
        canvas.renderAll();
        var image = document.getElementById("c").toDataURL("image/jpeg");
        console.log("save")
        image = image.replace('data:image/jpeg;base64,', '');
        var formData = new FormData();    
       
        var sid ="${login.sid}";
        
        formData.append("image", image);
        formData.append("sid", sid);
       
       
        $.ajax({
            
           url:'/admaker/onepage',
            data: formData,
            dataType:'text',
            processData : false,
            contentType:false,
            type:'post',
            success:function(re){
                console.log("re");
                console.log(re);
                
                var str = "<div class='col-md-3' style='border: 1px solid white; padding:0; width: 25%; background-color: black; float: left;'><div><img id='mybg' src='data:image/jpeg;base64,"+re+"' width='100%' ></div><input type='button' value='사진 삭제' class='submitLink'></div></div>"
                $(".uploadedList2").append(str);
                
                iscr.push("data:image/jpeg;base64,"+re);
                
                console.log(iscr);
                
                canvas.clear();
                
                console.log($(".uploadeList2"))
                
            
                    $(".uploadedList2 button").on("click",function(e){
                        
                        var $this = $(this);
                        console.log($this.parent())
                        $this.parent().parent().remove();
                        
                        console.log($(".uploadeList2"))
                        
                        
                        $.ajax({
                            type:'post',
                            url:'/admaker/delete',
                            data:re,
                            success:function(data){
                                
                                console.log(da);
                                
                                
                            }
                        });
                        
                        
                    });
                }
        });
    });
    
    $("#reset").click(function(){  	
    	
    	canvas.clear();    	
    	
    })
    
    $("#delete").click(function(){  	
    	
    	canvas.remove(canvas.getActiveObject());
    	
    })
    
    $("#deactive").click(function(){  	
    	console.log("test1")
    	
    	canvas.deactivateAll();
    	canvas.renderAll()
    	
    })
    
    
    $("#down").on('click', function() {
        
        console.log("보내는 중")
      

        var giffile = $("#img1")[0].src;
        var sid ="${login.sid}";
        
        console.log("giffile");

        $.ajax({
            url : "/admaker/adgif",
            type : "post",
            data : {
                "giffile" : giffile,
                "sid":sid
            },
            dataType : "json",
            success : function(data) {
                alert("success!!!")
            }

        });

    })
    
    $("#start").click(function(){
         console.log("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~iscr");
         console.log(iscr);
         
        gifshot.createGIF({
            gifWidth : 680,
            gifHeight : 1000,
            images : iscr,
            interval : 1,
            
        }, function(obj) {
            if (!obj.error) {
                var image = obj.image;
                animatedImage = document.getElementById('img1');
                animatedImage.src = image;
                console.dir($(this).parent())

            }
        });
         
         
         
     })
    
     	
})   	
	

</script>
	
	
	
	
<%@ include file="/WEB-INF/views/footer.jsp" %>