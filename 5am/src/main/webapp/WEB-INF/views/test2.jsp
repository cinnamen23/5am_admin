<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="div">
<form action="/test2" method="post">
<input class="input" type="hidden" name="lat">
<input class="ad1" value="서울특별시 송파구" type="text">
<input class="ad2" value="올림픽로 336" type="text">
<button class="btn">버튼</button>
</form>

</div>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<script>



$.ajax({
	url:'http://apis.daum.net/local/geo/addr2coord',
	type:'post',
	dataType : 'jsonp',
	data : {
		apikey: 'abcbd0a7a1e715eded5b461a92903dae',
			q: $(".ad1").val()+' '+$(".ad2").val(),
			output:'json'
		
	},
	success : function(result){
		result = result.channel;
		console.log(result.item[0].point_x)
		$(".input").val(result.item[0].point_x)
		
	}
	
})


</script>
</body>
</html>