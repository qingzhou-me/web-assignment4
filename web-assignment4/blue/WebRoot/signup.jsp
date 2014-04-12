<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*,lqm.servlet.DB" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
                       "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
<script type="text/javascript" src="js/jquery-1.3.1.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery.metadata.js"></script>
<script type="text/javascript" src="js/jquery.validate.messages_cn.js"></script>

<style type="text/css">
     form {background-color:yellow}
     label{width:12em;float:left;height:30px}
     label.error{float:none;color:red;padding-left:.5em;vertical-align:top;}
     p{clear:both;}
     .submit{margin-left:28em;}
     .focus{
            border:1px solid #f00;
            background:#fcc;
     }
     em{font-weight:bold;padding-right:1em;vertical-align:top;}
     
     em.error{
          background:url("images/unchecked.gif")no-repeat 0px 0px;
          padding-left:16px;
     }
     em.success{
          background:url("images/checked.gif")no-repeat 0px 0px;
          padding-left:16px;
     }
</style>

<script type="text/javascript">

      $(document).ready(function(){
           $(function(){
	           $(":input").focus(function(){
	                   $(this).addClass("focus");
	           }).blur(function(){
	                   $(this).removeClass("focus");
	           });
           });
            //自定义一个验证方法
           $.validator.addMethod(
              "formula",                        //验证方法的名称
              function(value,element,param){         //验证规则
                       return value==eval(param);
              },
              '请正确输入数学公式计算后的结果'             //验证提示信息
           ); 
           
           $("#commentForm").validate({
              rules:{
                  cname:{
                  required:true,
                  minlength:2
                  },
                  cpassword:{
                  required:true,
                  minlength:6
                  },
                  spw:{
                  required:true,
                  minlength:6,
                  equalTo: "#cpassword"
                  },
                  email:{
                  required:true,
                  email:true
                  },
                  url:"url",
                  contact:"required",
                  valcode:{formula:"7+9"}
              },
              
               messages: {
			   cname: {
				required: '请输入用户名',
				minlength: '请至少输入两个字符'
			 },
			  
			  cpassword:{
			    required:'请输入你的密码',
			    minlength: '请至少输入六个字符'
			  },			  
			  spw:{
			    required:'请再次输入你的密码',
			    minlength: '请至少输入六个字符',
			    equalTo: '两次密码不一致 '
			  },
			  email: {
				required: '请输入电子邮件',
				email: '请检查电子邮件的格式'
			 },
			 contact:'请输入你的联系方式',
			  url: '请检查个人博客的网址格式',
			 
		},	
		
		errorElement: "em", //可以用其他标签，记住把样式也对应修改
		success: function(label) {
			//label指向上面那个错误提示信息标签em
			label.text(" ")				//清空错误提示消息
				.addClass("success");	//加上自定义的success类
		}
           });
      });
      
</script>
 
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

</head>

<body>


     
<form class="cmxform" id="commentForm" method="post" action="register">
   <fieldset>
       <legend><strong>用户注册</strong></legend>
       
       <p>
           <label for="cname">用户名</label><em>*</em>
           <input id="cname" name="cname" size="58"/>
       </p>
       
       <p>
           <label for="cpassword">密码</label><em>*</em>
           <input id="cpassword" name="cpassword" type="password" size="58">
       </p>
       
       <p>
           <label for="spw">请再次输入密码</label><em>*</em>
           <input id="spw" name="spw" type="password" size="58">
       </p>
       
        <p>
            <label for="contact">你的联系方式</label><em>*</em>
            <input id="contact" name="contact" size="58"/>
        </p>
       
        <p>
           <label for="cemail" >电子邮件</label><em>*</em>
           <input id="cemail" name="email" size="58"/>
        </p>
       
        
        <p>
            <label for="url">个人博客地址</label><em>&nbsp; </em>
            <input id="curl" name="url" size="58" value=""/>
        </p>
                 
        <p>
            <label for="cvalcode">验证码</label><em>*</em>
            <input id="cvalcode" name="valcode" size="58" value=""/>=7+9
        </p>
        
        <p>
        	<input name="action" type="hidden" value="register" />
            <input class="submit" type="submit" value="提交"/>
        </p>
       
   </fieldset>
</form>

</body>

</html>



