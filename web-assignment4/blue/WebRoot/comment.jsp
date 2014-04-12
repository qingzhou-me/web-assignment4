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
     label{width:12em;float:left;}
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
                  username:{
                  required:true,
                  minlength:2
                  },
                  email:{
                  required:true,
                  email:true
                  },
                  url:"url",
                  comment:"required",
                  valcode:{formula:"7+9"}
              },
              
               messages: {
			   username: {
				required: '请输入姓名',
				minlength: '请至少输入两个字符'
			 },
			  email: {
				required: '请输入电子邮件',
				email: '请检查电子邮件的格式'
			 },
			  url: '请检查网址的格式',
			  comment: '请输入您的评论'
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
   

</head>

<body>


     
<form class="cmxform" id="commentForm" method="get" action="comment">
   <fieldset>
       <legend><strong>您的评论是我们前进的动力源泉</strong></legend>
       
       <p>
           <label for="cusername">姓名</label><em>*</em>
           <input id="cusername" name="username" size="25"/>
       </p>
       
       <p>
           <label for="cemail" >电子邮件</label><em>*</em>
           <input id="cemail" name="email" size="25"/>
        </p>
        
        <p>
            <label for="curl">网址</label><em>&nbsp; </em>
            <input id="curl" name="url" size="25" value=""/>
        </p>
        
        <p>
            <label for="ccomment">你的评论</label><em>*</em>
            <textarea  id="ccomment" name="comment" rows="16" cols="86"></textarea>
        </p>
                 
        <p>
            <label for="cvalcode">验证码</label><em>*</em>
            <input id="cvalcode" name="valcode" size="25" value=""/>=7+9
        </p>
        
        <p>
            <input name="action" type="hidden" value="comment" />
            <input class="submit" type="submit" value="提交"/>
        </p>
       
   </fieldset>
</form>

</body>

</html>

