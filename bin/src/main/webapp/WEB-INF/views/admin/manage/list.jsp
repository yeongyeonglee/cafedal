<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link type="text/css" rel="stylesheet"
   href="${path}/resource/css/adminliststyle.css">
<style>
.listnum ul{  
      padding-left: 900px;
    list-style:none;  
    float:left;  
    display:inline;  
}  
.listnum ul li{  
    float:left;  
}  
.listnum ul li a {  
    float:left;  
    padding:4px;  
    margin-right:3px;  
    width:15px;  
    color:#000;  
    font:bold 12px tahoma;  
    border:1px solid #eee;  
    text-align:center;  
    text-decoration:none;  
}  
.listnum ul li a:hover, .listnum ul li a:focus {  
    color:#fff;  
    border:1px solid  #7b4122;  
    background-color: #7b4122;  
} 
</style>
<main class="main">

<div style="margin-top:30px; margin-bottom: 40px;">

   <label class="list-tit" style="padding-right:30px;">회원 관리</label>
     <a href="../useinfo/notice">  
        <img src="${path}/resource/images/menu1.png" style="width: 50px; height: 40px; padding-right: 10px; margin-bottom: -10px" alt="이용"/></a>
     <a href="../dcinfo/notice">  
        <img src="${path}/resource/images/menu2.png" style="width: 50px; height: 40px; padding-right: 10px; margin-bottom: -10px" alt="할인"/></a>

</div>


<!--    <div class="ph-heart-nav nav">
      <a href="notice">All</a>
      <a href="notice?f=cafecode&q=1">GongCha</a>
      <a href="notice?f=cafecode&q=2">Starbucks</a>
      <a href="notice?f=cafecode&q=3">Ediya</a>
      <a href="notice?f=cafecode&q=4">CoffeeBean</a>
      <a href="notice?f=cafecode&q=5">Twosome</a>
      <a href="notice?f=cafecode&q=6">Hollys</a>
      <div class="effect"></div>
   </div>   
   
 -->



<h3 class="hidden">회원정보 목록</h3>
      <form action="?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
         <table class="table-garo-admin">
               <tr>
                   <th id="tr_id">아이디</th>
                    <th id="tr_pw">비밀번호</th>
                     <th id="tr_name">이름</th>
                      <th id="tr_mail">이메일</th>
                      <th id="tr_birth">생일</th>
                      <th id="tr_cafes">카페</th>
               </tr>
            <c:forEach var="m" items="${list}">
               <tr>
                     <td id="tr_id">${m.id}</td>
                     <td id="tr_pw">${m.pwd}</td>
                     <td id="tr_name">${m.name}</td>
                     <td id="tr_mail">${m.mail}</td>
                     <td id="tr_birth">${m.birth}</td>
                     <td id="tr_cafes">${m.cafes}</td>
               </tr>
            </c:forEach>
          </table>
          
          <h3 class="hidden">회원목록 검색폼</h3>
			<div class="d1">
			   <form >
			
			      <select
			            name="f">
			            <option selected="selected" value="dtitle">아이디</option>
			            <option value="dcontent">이름</option>
			         </select> <input class="btn-search" type="text" name="q" placeholder="검색어 입력">
			         <input class="btn-button" type="submit" value="▶" />
			   
			   </form>
			</div>

		<!-- 리스트 : 이전  1 2 3 4 5 ... 다음 --> <c:set var="page" value="${param.p}" />
		<c:set var="startNum" value="${page-((page-1)%5)}" /> <c:set
		   var="lastNum"
		   value="${fn:substringBefore(count%10 ==0 ? count/10 : count/10+1, '.')}" />
		   
		  
		   <div class="listnum">
		      <ul class="listnum">
		         <c:forEach var="i" begin="0" end="4">
		            <c:set var="strong" value="" />
		            <c:if test="${page == startNum+i }">
		               <c:set var="strong" value="text-strong" />
		            </c:if>
		            <c:if test="${startNum+i <= lastNum }">
		               <li><a class="${strong }" href="?p=${startNum+i}">${startNum+i}</a></li>
		            </c:if>
		            <c:if test="${startNum+i > lastNum }">
		               <li><a href="?p=${startNum+i}">${startNum+i}</a></li>
		            </c:if>
		         </c:forEach>
		      </ul>
		      <div>
		         <c:if test="${lastNum >= startNum+5 }">
		            <a href="?p=${startNum+5}">다음</a>
		         </c:if>
		      </div>
		   </div>

</main>