<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>effect3.jsp</title>
<style>
		.box{
			width:100px;
			height:100px;
			background-color:yellow;
			border:1px solid red;
		}
		.box2{
			width:100px;
			height:100px;
			background-color:yellow;
			border:1px solid red;
			/* transition 효과를 줄 수 있는 모든 css 속성에 대해서 1초 동안 일정한 비율로
				적용을 시켜라
			*/
			transition:all 1s linear;
		}
</style>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggleBtn">토글</button>
	<button id="moveBtn">움직이기</button>
	<button id="moveBtn2">움직이기2</button>
	<button id="moveBtn3">움직이기3</button>
	<div class="box"></div>
	<div class="box2"></div>
	<script>
		$("#moveBtn3").on("click",function(){
			$(".box2").css("margin-left","100px")
		});
	/*
		움직이기 버튼을 눌렀을때 box를 오른쪽으로 100px 움직이게 해보세요
		단 1초동안 진행되도록
	*/
		$("#moveBtn").on("click",function(){
			let mLeft=0; 
			//1/100초 마다 한번씩 호출되는 함수안에 박스 움직이기
			
			setInterval(function(){
				mLeft += 1;
				if(mLeft >=101){
					return;
				}
				$(".box").css("margin-left", mLeft+"px");
			 },10);
		});
	    /*
	    숨기기 버튼을 누르면 box div 가 숨겨지고, 보이기 버튼을 누르면 보여지도록 jquery
	    를 활용해서 프로그래밍 해 보세요.
	    - hint   
	       $( ).on("click", function(){});
	        $( ).css("속성명", "속성값");
	 	*/
	 	
	 	$("#moveBtn2").on("click",function(){
	 		$(".box").animate({
	 			marginLeft:"+=100px",
	 			duration:1000
	 		},1000);
	 	});

		$("#hideBtn").on("click",function(){
			$(".box").fadeOut(1000,function(){
				alert("얍");
			});
		});
		$("#showBtn").on("click",function(){
			$(".box").fadeIn({
				duration:1000,
				complete:function(){
					alert("짠");
				}
			});
		});
		$("#toggleBtn").on("click",function(){				
			$(".box").fadeToggle();
		});
	</script>
</body>
</html>





