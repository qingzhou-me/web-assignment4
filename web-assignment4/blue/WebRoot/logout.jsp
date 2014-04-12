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

      });      
</script>

</head>

<body>
     
<form class="cmxform" id="commentForm" method="post" action="logout">
   <fieldset>
       <legend><strong>注销用户</strong></legend>
        <p>你是否确定要注销用户<p>
        <p>
        	<input name="action" type="hidden" value="logout" />
            <input class="submit" type="submit" value="确定"/>
        </p>
       
   </fieldset>
</form>

</body>

</html>



