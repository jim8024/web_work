<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/fetch/test04.jsp</title>
</head>
<body>
   <button id="moreBtn">더보기</button>
   <ul id="msgList">
   		<li>하나</li>
   		<li>두울</li>
   		<li>세엣</li>
   </ul>
   <script>
      //문자열을 입력하고 전송 버튼을 눌렀을때 입력한 문자열을 읽어와서 send.jsp 페이지로 전송이 되도록 하기
      document.querySelector("#moreBtn").addEventListener("click", ()=>{
         fetch("get_msg2.jsp")
         .then(res=>res.text())
         .then((data)=>{
        	//data는 [ "어쩌구", "저쩌구", "이렇쿵" ]
        	//형식의 JSON문자열이다
        	 console.log(data);
       		//실제 배열로 바꾸기(json형식에 어긋나면 에러 발생)
       		const list=JSON.parse(data);
       		for(let i=0;i<list.length;i++){
       			//backtick을 활용해서 li안에 메세지 출력하고
       			let li=`<li>\${list[i]}</li>`;//역슬레쉬 필요
       			//ul이 끝나기 전에 HTML요소로 평가해서 추가하기
       			document.querySelector("#msgList").insertAdjacentHTML("beforeend",li);
       		}
         });
      });
   </script>
</body>
</html>




