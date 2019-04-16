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
     <form>
	        编号：<input type="text" name="cid" value="${param.cid}"><br><br>
	        姓名：<input type="text" name="cname"><br><br>
	        身份证号：<input type="text" name="cno"><br><br>
	        性别：<input type="radio" name="sex" value="男">男
	        <input type="radio" name="sex" value="女">女<br><br>
	        描述：<input type="text" name="cdesc"><br><br>
	        年龄：<input type="text" name="age"><br><br>
     </form>
</body>
<script type="text/javascript">
    $(function(){
    	var cid = ${param.cid}
    	$.ajax({
    		url:"getOne",
    		type:"post",
    		data:{cid:cid},
    		success:function(obj){
    			$("[name=cname]").val(obj.cname);
    			$("[name=cno]").val(obj.cno);
    			$("[name=age]").val(obj.age);
    			$("[name=cdesc]").val(obj.cdesc);
    			$("[name=sex][value='"+obj.sex+"']").attr("checked",true);
    		},
    		dataType:"json"
    	})
    })
</script>
</html>