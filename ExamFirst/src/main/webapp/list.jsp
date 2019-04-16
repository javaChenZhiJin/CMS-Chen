<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.2.min.js"></script>
<title>Insert title here</title>
</head>
<body>
          <form action="list" method="post">
                                  罪犯姓名：<input type="text" name="cname" value="${cname}">
             <input type="submit" value="搜索">
          </form>
          <table>
             <tr>
                <td>编号</td>
                <td>姓名</td>
                <td>身份证号</td>
                <td>性别</td>
                <td>年龄</td>
                <td>
                  <input type="button" value="添加" onclick="location='add.jsp'">
                </td>
             </tr>
             <c:forEach items="${list}" var="l">
                 <tr>
	                <td>${l.cid}</td>
	                <td>${l.cname}</td>
	                <td>${l.cno}</td>
	                <td>${l.sex}</td>
	                <td>${l.age}</td>
	                <td>
	                  <input type="button" value="详情" onclick="location='getOne.jsp?cid=${l.cid}'">
	                  <input type="button" value="修改" onclick="location='update.jsp?cid=${l.cid}'">
	                  <input type="button" value="删除" onclick="del(${l.cid})">
	                </td>
	             </tr>
             </c:forEach>
             <tr>
                <td colspan="11">
                  ${fenye}
                </td>
             </tr>
          </table>
</body>
<script type="text/javascript">
  function del(cid){
	  $.ajax({
		  url:"delRole",
		  type:"post",
		  data:{cid:cid},
		  success:function(obj){
			  if(obj){
 				 alert("提交成功");
 				 location="list";
 			 }else{
 				 alert("提交失败，请核实信息");
 				location="list";
 			 }
		  },
		  dataType:"text"
	  })
  }
</script>
</html>