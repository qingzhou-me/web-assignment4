<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*,lqm.servlet.DB" %>

<html>
<head>
<title>管理员用户登录</title>
	<script type="text/javascript" src="js/trim.js"></script>
    <script type="text/javascript">  
      function checkLogin()
      {
        var mname = document.all.mname.value.trim();
        var mpassword = document.all.mpassword.value.trim();
        if(mname=="")
        {
           	alert("用户名不能为空!!!");
      		return;
        }
        if(mpassword=="")
        {
           alert("密码不能为空!!!");
           return;
        }
        document.anform.submit();
      }
   </script>
   <%
     String userStr=(String)session.getAttribute("user");
     if(userStr!=null)
     {
       request.setAttribute("msg","请您注销后再登录其他用户名！");
   %>
      <jsp:forward page="index.jsp"/>
   <%
     }
   %>   
 </head>
<body style="background:url('images/bg1.gif')"><center>
<table border="10" width="600" style="border:10px solid #6daafc">
  <tr>
    <td>
		<table border="0" width="100%">
		  <caption style="font-size:2.2em;font-weight:bold">管理员用户登录</caption>
		  <form action="managerlogin" name="anform"  method="post">
			<tr>
				<td align="right" width="150"><font size="5px">请填写用户名</font></td>
				<td width="400"><input name="mname" type="text" id="mname" size="45"/></td>
			</tr>
			<tr>
				<td align="right" width="150"><font size="5px">请填写密码</font></td>
				<td width="400"><input name="mpassword" type="password" id="mpassword" size="48"/></td>
			</tr>
			</table>
			<table border="0" align="center">
			<tr align="center">
				<td align="right"><img border="0" id="dl"
					 onmousedown="document.all.dl.src='images/dl1.png'" 
			    	 onmousemove="document.all.dl.src='images/dl2.png'" 
			    	 onmouseout="document.all.dl.src='imgages/dl3.png'"
			    	 src="images/dl1.png" onclick="checkLogin()" style="cursor:hand" />
					 <input name="action" type="hidden" value="managerlogin"/>
				</td>
				<td align="left"><a href="javascript:history.back()"><img border="0" id="fh"
					 onmousedown="document.all.fh.src='images/fh1.png'" 
			    	 onmousemove="document.all.fh.src='images/fh2.png'" 
			    	 onmouseout="document.all.fh.src='imgages/fh3.png'"
			    	 src="images/fh1.png" style="cursor:hand" /></a>
			    </td>
			</tr>
		</form>
		</table>
    </td>
  </tr>
</table>
</center>

<script>
      <% 
        String msg=(String)request.getAttribute("msg");
        if(msg!=null)
        {
      %>
         alert('<%=msg%>');
      <%
        }
       %>
</script>
 </body>
</html>