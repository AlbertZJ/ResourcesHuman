<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
    <%@page import="human.EmployeeDAO" %>
    <%@page import="human.Employee" %>
    <%@page import="java.util.List" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工信息删除和修改界面</title>

<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="jqueryui/style.css">
  <style>
  label {
    display: inline-block;
    width: 5em;
  }
  </style>
  <script>
  $(function() {
    $( document ).tooltip({
      track: true
    });
  });
  </script>
</head>
<body bgcolor="lightblue">
 <script language="JavaScript" type="text/JavaScript">
		/* 是否全选标记 */
		var checkedAll = false;

		/* 全选/取消全选 
		 * formName 所在form的name值 
		 * checkboxName checkbox的name值 
		 * 注意：所有checkbox的name值都必须一样，这样才能达到全选的效果 
		 */
		function selectAll(formName, checkboxName) {
			var form = document.all.item(formName);
			var elements = form.elements[checkboxName];
			for (var i = 0; i < elements.length; i++) {
				var e = elements[i];
				if (checkedAll) {
					e.checked = false;
					form.alls.checked = false;
				} else {
					e.checked = true;
					form.alls.checked = true;
				}
			}
			if (checkedAll) {
				checkedAll = false;
			} else {
				checkedAll = true;
			}
		}
		/* 检查是否有checkbox被选中 
		 * formName 所在form的name值 
		 * checkboxName checkbox的name值 
		 * 注意：所有checkbox的name值都必须一样，这样才能达到全选的效果 
		 */
		function checkAll(formName, checkboxName) {
			var hasCheck = false;
			var form = document.all.item(formName);
			var elements = form.elements[checkboxName];
			for (var i = 0; i < elements.length; i++) {
				var e = elements[i];
				if (e.checked) {
					hasCheck = true;
				}
			}
			return hasCheck;
		}
		/* 执行操作 */
		function do_action() {
			var result;
			if (!checkAll("formName", "no")) {
				alert("没有多选框被选中，若要提交至少选择一个！");
			return false;
			} /* else {
				alert("已有checkbox被选中，可以继续后续操作！");
			} */
			return true;
		}
	</script>
 <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/humanresources?useUnicode=true&characterEncoding=utf-8"
		user="root" password="123456" />
	<sql:query dataSource="${snapshot}" var="result1">
SELECT * from department;
</sql:query>
<sql:query dataSource="${snapshot}" var="result2">
SELECT * from technical_title;
</sql:query>
<sql:query dataSource="${snapshot}" var="result3">
SELECT * from post;
</sql:query>
 <sql:query dataSource="${snapshot}" var="result4">
SELECT * from think;
</sql:query>
  
<center>
<font face="楷体"   size="6" color="#000">员工信息删除和修改</font>
 </center> 
	<form name="formName" action = "add_employee.jsp" method = "post" onsubmit = "return  do_action()">
  	<table   id="dataList" width="200" align="center"    border="1" style=" border-collapse: collapse;" >
  	  <tr    height="10">
  	 <th><input type="checkbox" name="alls"
						onClick="selectAll('formName','no')" title="全选/取消全选"> 选择</th>
		<th>员工编号</th>
		<th>员工的姓名</th>
			<th>性别</th>
			<th>年龄</th>
			<th>学历</th>
			<th>专业</th>
			<th>外语情况</th>
			<th>毕业时间</th>
			<th>婚姻状况</th>
			<th>工作岗位</th>
			<th>所在部门</th>
			<th>职称</th>
			<th>状态</th>		 
  	  </tr>
  	  <% 
  	EmployeeDAO dao=new EmployeeDAO();
     List<Employee> list =dao.readFirstTitle();    
      for(Employee tl:list)    	  
   {   %>  
  <tr>
    <td><input type="checkbox" name="no" 
						value="<%=tl.getE_id() %>"></td>
     
     <td   ><input type="text" name="e_id<%=tl.getE_id() %>" value="<%=tl.getE_id() %>"     readonly="readonly"/></td>
     <td   >
     <input type="text" name="e_name<%=tl.getE_id() %>" value="<%=tl.getE_name() %>" maxlength = "7"   required="required"/>
       </td>
          <td >
          <select name="sex<%=tl.getE_id() %>">
       <option><%=tl.getSex() %></option>
 		<option  >男</option>
 		<option  >女</option>
 		 
 		</select>
          
          </td>
        <td ><input type="number" name="age<%=tl.getE_id() %>" value="<%=tl.getAge() %>"  min="18" max="80" required="required"    /></td>
       <td >
       <select name="edu_background<%=tl.getE_id() %>">
       <option><%=tl.getEdu_background() %></option>
 		<option  >专科</option>
 		<option  >本科</option>
 		<option  >硕士</option>
 		<option  >博士</option>
 		<option  >其他</option>
 		</select>
           </td>
      <td >
      <select name="speciality<%=tl.getE_id() %>">
      <option><%=tl.getSpeciality() %></option>
 		<c:forEach var="row" items="${result4.rows}">
 		<option  ><c:out value="${row.speciality}" /></option>
 		 </c:forEach>
 		</select>
        </td>
       <td   > 
       <select name="foreign_language<%=tl.getE_id() %>">
 		 <option><%=tl.getForeign_language() %></option>
 		<option  >英语</option>
 		<option  >法语</option>
 		<option  >西班牙语</option>
 		<option  >俄语</option>
 		 
 		</select>
             </td>
      <td   >  
      	<input type="date" name="grad_time<%=tl.getE_id() %>" value="<%=tl.getGrad_time() %>" />     
       </td> 
      <td >
      <select name="marriage<%=tl.getE_id() %>">
      <option><%=tl.getMarriage() %></option>
 		<option  >已婚</option>
 		<option  >未婚</option>
 		 
 		</select>
             </td>
      <td >
      <select name="post<%=tl.getE_id() %>">
      <option><%=tl.getPost() %></option>
 		<c:forEach var="row" items="${result3.rows}">
 		<option  ><c:out value="${row.post}" /></option>
 		 </c:forEach>
 		</select>
        </td>
       <td   > 
       <select name="department<%=tl.getE_id() %>">
       <option><%=tl.getDepartment() %></option>
 		<c:forEach var="row" items="${result1.rows}">
 		<option  ><c:out value="${row.department}" /></option>
 		 </c:forEach>
 		</select>              
           </td>
      <td   > 
      <select name="technical_title<%=tl.getE_id() %>">
      <option><%=tl.getTechnical_title() %></option>
 		<c:forEach var="row" items="${result2.rows}">
 		<option  ><c:out value="${row.technical_title}" /></option>
 		 </c:forEach>
 		</select>      
       </td> 
       <td   >  
       <select name="state<%=tl.getE_id() %>">
       <option><%=tl.getState() %></option>
 		<option  >在职</option>
 		<option  >转出</option>
 		<option  >辞职</option>
 		<option  >辞退</option>
 		<option  >退休</option>
 		 
 		</select>     
       </td> 
      </tr>     
     <% }
          %>   	    
	   <tr       height="30">
 		<td colspan = "14" align = "center">
 		   <input type="submit" name="sub" value="删除"    />  
 		  <input type="submit" name="sub" value="修改"   />    
 		  <input type="reset" value="取消"/>
 		</td>
	  </tr>
	</table>	
    </form>
    
</body>
</html>