<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Ajax File Upload...536p</title>

	<style>
	.fileDrop {
		width: 100%;
		height: 200px;
		border: 1px dotted blue;
	}
	
	small {
		margin-left: 3px;
		font-weight: bold;
		color: gray;
	}
	</style>

</head>
<body>
	
	<h3>Ajax File Upload</h3>
	<div class='fileDrop'></div>

	<div class='uploadedList'></div>

	<script src="http://code.jquery.com/jquery-2.1.4.js"></script>
	<script>
		/*
			...538p.이미지파일을 dragenter dragover drop 할 경우 기본동작을 막음.
			...event.preventDefault();을 하지 않으면 브라우저에 파일을 끌어다 놓으면
			...자동으로 새로운 창이 열리고, 파일이 보이게 됨.
		*/
		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});
	
		$(".fileDrop").on("drop", function(event){
			event.preventDefault();
			
			/*
				...539p.
				...drop이벤트가 발생하면, dataTransfer.files로 파일 데이터가 전달됨.
				...event.originalEvent는 jQuery를 이용할 경우, event가 순수한 DOM 이벤트가
				...아니므로 event.originalEvent를 이용해서 순수한 원래의 DOM 이벤트를 가져옴.
				...event.dataTransfer는 이벤트와 같이 전달된 데이터를 의미함.
				...dataTransfer.files는 event.dataTransfer에 포함된 파일 데이터임.
				...브라우저검사도구에서 console.log(file);를 확인하면 type: "image/jpeg"를
				...확인할 수 있음.
			*/
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			console.log("Drop한 파일 정보 : " + file);		
			/*
				...540p.
				...Ajax는 전통적인 form태그와 다르므로 과거에는 주로 문자열을 전송할 때 사용했지만,
				...HTML5에서 지원하는 FormData객체를 이용하면 form태그로 만든 데이터의 전송방식과
				...동일하게 파일 데이터를 전송할 수 있음.
				...객체를 생성하고, 필요한 데이터 '이름'과 '값'을 추가함.
			*/
			var formData = new FormData();
			formData.append("file", file);
			
			/*
				...543p.
				...특이한 점은 Ajax를 POST방식으로 이용하지만, $.post()를 사용하지 않고
				...굳이 $.ajax()를 이용한 점임.
				...$.ajax()를 이용해서 FormData객체에 있는 파일 데이터를 전송하기 위해서는
				...아래 코드에 나와있는 'processData'와 'contentType' 옵션을 반드시 false로 지정해야함.
				...이 두 옵션이 데이터 전송을 form태그를 이용하는 파일 업로드와 동일하게 해주는 
				...결정적인 역할을 함.
			*/
			$.ajax({
				  url: '/uploadAjax.do',
				  data: formData,
				  dataType:'text',
				  processData: false,
				  /*
				  	...processData: false
				  	...데이터를 일반적인 query string으로 변환할 것인지를 결정함.
				  	...기본값은 true이고 'application / x-www-form-urlencoded'타입으로 전송함.
				  	...다른 형식의 데이터를 보내기 위해 자동변환하고 싶지 않은 경우는 false로 지정함.
				  */
				  contentType: false,
				  /*
				  	...contentType: false
				  	...기본값은 'application / x-www-form-urlencoded'이고,
				  	...파일의 경우 multipart/form-data방식으로 전송하기 위해 false로 지정함.
				  */
				  type: 'POST',
				  success: function(data){
					  
					//alert(data); //...569p.주석처리.
					//...이미지 파일을 올리면 썸네일 이미지 또는 일반 파일명이 아래쪽에 보여짐.
					  var str ="";
					  if(checkImageType(data)){
						  
						  /*...574p.주석처리.						  	
							str ="<div>"
								+"<img src='displayFile.do?fileName=" + data + "'/></a>"
							  	+ data 
							  	+"</div>";						  
						  
							...576p.주석처리.
							str ="<div><a href='displayFile.do?fileName=" + getImageLink(data) + "'>"
						  	  +"<img src='displayFile.do?fileName=" + data + "'/></a>"
						  	  + data 
						  	  +"</div>";
						  	  ...576p.삭제버튼추가.
						  */
						  str ="<div>" 
						  	  +"<a href=displayFile.do?fileName="+getImageLink(data)+">"
						      +"<img src='displayFile.do?fileName="+data+"'/>"
						      +"</a>"
						      +"<small data-src="+data+">X</small>"
						  	  +"</div>";
								  
						}else{
						  
							/*...572p.주석처리.
							str = "<div>" 
							  + data 
							  +"</div>";
							  ...576p.주석처리.
							  str = "<div><a href='displayFile.do?fileName="+data+"'>" 
							  + getOriginalName(data)+"</a></div>";
							  ...576p.삭제버튼추가.
							 */
							str = "<div>" 
								+"<a href='displayFile.do?fileName="+data+"'>" 
							    + getOriginalName(data)
							    +"</a>"
							    +"<small data-src="+data+">X</small>";
							    +"</div>";
							 
						}//...E.if(checkImageType(data)){
						$(".uploadedList").append(str);
				  }
				});	//...E.$.ajax.			
				
		});//...E.$(".fileDrop").on("drop", function(event){
		
		/*
			...579p.
			...화면에서 small태그로 된 'x' 삭제버튼을 클릭하면 'data-src'속성값으로
			...사용된 파일의 이름을 얻어와서 POST방식으로 호출함.
		*/			
		$(".uploadedList").on("click", "small", function(event){
			 var that = $(this);
		   $.ajax({
			   url:"/deleteFile.do",
			   type:"post",
			   data: {fileName:$(this).attr("data-src")},
			   dataType:"text",
			   success:function(result){
				   if(result == 'deleted'){
					   that.parent("div").remove();
				   }
			   }
		   });
		});//...E.$(".uploadedList").on("click", "small", function(event){		
		
		//...569p.파일의 확장자가 존재하는지 검사함.
		function checkImageType(fileName){
			
			//...i : 대,소문자 구분 없음.
			var pattern = /jpg|gif|png|jpeg/i;
			
			return fileName.match(pattern);
			
		}	
		
		//...571p.
		//...일반 파일의 이름이 너무 길게 출력되는데 이를 줄여주는 기능을 함.
		//...첨부파일의 이름이 UUID와 첨부파일의 이름이 결합될 때 '_'가 사용되는 것을
		//...이용해서 원래의 파일 이름만을 추출함.
		function getOriginalName(fileName){	
			if(checkImageType(fileName)){
				return;
			}
			
			var idx = fileName.indexOf("_") + 1 ;
			console.log("fileName.substr(idx) : " + fileName.substr(idx));				
			return fileName.substr(idx);
			
		}	
		
		//...573p.
		//...첨부파일이 이미지인 경우, 썸네일이 아닌 실제 원본 이미지 데이터를 가져와야만하므로
		//...썸네일 파일명 중간에 's_'경로를 제거하면 원래의 이미지 파일이 됨.
		function getImageLink(fileName){
			
			if(!checkImageType(fileName)){
				return;
			}
			//...'년/월/일'경로를 추출함.
			var front = fileName.substr(0,12);
			//...파일ㅇ 이름 앞의 's_'를 제거함.
			var end = fileName.substr(14);
			
			return front + end;			
		}		
	</script>

</body>
</html>

