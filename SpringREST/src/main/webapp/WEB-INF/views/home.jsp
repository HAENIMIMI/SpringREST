<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<hr>

	<input type="button" value="Create" id="btnC">
	<input type="button" value="Read" id="btnR">
	<input type="button" value="Read(list)" id="btnL">
	<input type="button" value="Update" id="btnU">
	<input type="button" value="Delete" id="btnD">


	<hr>
	
	<div id="read"></div>


	<script src="https://code.jquery.com/jquery-3.6.3.js" 
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
		crossorigin="anonymous"></script>
		
	<script type="text/javascript">
		$(function(){
			// 글쓰기 버튼 클릭 시 - 글쓰기 동작 수행
			$("#btnC").click(function(){
				
				// 글 정보(객체)
				var board = {
					bno:"1",
					title:"test1",
					content:"content1",
					writer:"admin1",
					regdate:"2022-12-26",		// 날짜 데이터는 JSON으로 파싱할 수 없어서 문자 데이터로 바꿔서 전달해야 함!
					//regdate:"2022-12-26 11:30:22",	// 단, 콜론이 들어가는 시간 데이터는 처리하기 어려움...!
					viewcnt:10
				};	// 객체 생성 완
				
				// ajax를 사용해서 RestController로 전달 
				// POST		/boards+데이터
				$.ajax({
					type:"post",
					url:"/boards",
					contentType:"application/json",
					data:JSON.stringify(board),
					success:function(data){
						alert("성공!");
						alert("글쓰기 여부 : " + data);
					}, error:function(data){
						alert("에러");
						console.log(data);
					}
				}); // ajax
				
			}); // #btnC
			
			// 글 조회		GET			/boards/100
			$("#btnR").click(function(){
				// ajax 사용해서 RestController에서 정보 받아오기
				$.ajax({
					type:"get",
					url:"/boards/100",
					success:function(data){
						alert("조회 성공!");
						// alert(data);
						console.log(data);
						$("#read").append(
							data.bno+" / "+data.title+" / "+data.content+" / "+data.writer		
						);
					}
					
				}); // ajax
				
			}); // #btnR
			
			
			// 글 조회(list) 		방식 : GET		주소URI : /boards/all
			$("#btnL").click(function(){
				$.ajax({
					type:"get",
					url:"/boards/all",
					success:function(list){
						alert("all");
						console.log(list);
						//for(var vo in list){
							// $("#read").append(vo + "<br>");
							// $("#read").append(list[vo].bno + "<br>");
						//}
						$(list).each(function(index,vo){
							$("#read").append(vo.bno+" // " + vo.title + "<br>");
						});
					}
					
				});
			});	// #btnL
			
			
			
			// 수정 	PUT		/boards/100+(수정할)데이터
			/*
				$.ajax({
					type:"put",
					url:"/boards/100",
					contentType:"application/json",
					data:JSON,stringify(board),
					success:function(){
						
					}
				});
			*/
			
			
			// 삭제
			/*
				$.ajax({
					type:"delete",
					url:"/boards/100",
					contentType:"application/json",
					data:JSON,stringify(board),
					success:function(){
						
					}
				});
		*/
			
			
			
			
		});		// jquery
	</script>	



</body>
</html>
