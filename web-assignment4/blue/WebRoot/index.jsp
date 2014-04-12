<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<!-- InstanceBegin template="/Templates/index blue skies.dwt" codeOutsideHTMLIsLocked="false" -->

<head>

  <title>Join us</title>
   <meta name="keywords" content="Qiuming Lu, design patterns, collaborative learning, project-based learning, 
   problem-based learning,learning design patterns, learning software patterns, software patterns, semantic web, 
   e-learning, ontologies, DEPTHS, personalized learning, adaptive learning, educational services" />
   <meta name="description" content="Semantically enabled collaborative learning environment" />
   <meta http-equiv="content-type" content="text/html; charset=utf-8" />
   <meta http-equiv="X-UA-Compatible" content="IE=9" />
   
   <script type="text/javascript">
   var _gaq = _gaq || [];
   _gaq.push(['_setAccount', 'UA-21877784-2']);
   _gaq.push(['_trackPageview']);
   (function() {
     var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
     ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
     var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
   })();
   </script>
   
   <link rel="stylesheet" type="text/css" href="css/style.css" />
   <script type="text/javascript" src="js/jquery.min.js"></script>
   <script type="text/javascript" src="js/image_slide.js"></script>
   
</head>

<body>
  <div id="main">
    <div id="header">
	  <div id="banner">
	    <div id="welcome">
	      <h1>Blue Skies</h1>
	    </div><!--close welcome-->
	    <div id="welcome_slogan">
	      <h1>Welcome to join us</h1>
	    </div><!--close welcome_slogan-->
	  </div><!--close banner-->
    </div><!--close header-->

	<div id="menubar">
	
      <ul id="menu">
        <li class="current"><a href="index.jsp">Home</a></li>
        <li><a href="ourwork.jsp">Our Work</a></li>
        <li><a href="testimonials.html">Testimonials</a></li>
        <li><a href="projects.html">Projects</a></li>
        <li><a href="contact.html">Contact Us</a></li>
      </ul>
    
    </div><!--close menubar-->	
    
	<div id="site_content">		

	  <div class="sidebar_container">       
		<div class="sidebar">
          <div class="sidebar_item">
            <h2>Project Overview</h2>
            <p>
               <br>Design Patterns Teaching Help System</br>
               <br>Semantically-enabled collaborative learning environment</br>
            </p>
          </div><!--close sidebar_item--> 
        </div><!--close sidebar--> 
            		
		<div class="sidebar">
          <div class="sidebar_item">
            <h2>Go for it</h2>
            <h3>March 2014</h3>
            <p>Starting to......</p>         
		  </div><!--close sidebar_item--> 
        </div><!--close sidebar-->
		
		<div class="sidebar">
          <div class="sidebar_item">
            <h3>February 2013</h3>
            <p>My teachers give me an idea.So we decided to make a website,which is design patterns teaching help system. </p>         
		  </div><!--close sidebar_item--> 
        </div><!--close sidebar-->  
		
		<div class="sidebar">
          <div class="sidebar_item">
            <h3>January 2014</h3>
            <p>I create an idea about how to make our students study more efficient. But how to achieve it?</p>         
		  </div><!--close sidebar_item--> 
        </div><!--close sidebar--> 
       
        <div class="sidebar"> 
         <h2 class="sidebar_item">Interesting.<span>links</span></h2>
           <p><a href="http://goodoldai.org/">GOOD OLD AI Research Network</a></p>
           <p><a href="http://www.intelleo.eu/">IntelLEO project</a></p>
           <p><a href="http://www.learningdesignpatterns.org">DEPTHS project</a></p>
           <p><a href="http://op4l.fon.bg.ac.rs/">OP4L project</a></p>
           <p>&nbsp;</p>
        </div> 		
       
        <div class="sidebar">
        
          <div class="sidebar_item">
            <h2>Contact with me</h2>
            <p>Phone: +86 18811437370</p>
            <p>Email: <a href="ming1119181743@gmail.com">ming1119181743@gmail.com</a></p>
          </div><!--close sidebar_item--> 
       
        </div><!--close sidebar-->
        
        <div class="sidebar">
        
          <div class="sidebar_item">
            <h2>Login</h2>
            <p><a href="login.jsp">
            <%
            if(session.getAttribute("user")==null)
            { 
            	String msg = "user login";
		        request.setAttribute("msg",msg);
		        out.print("user login");
            } 
            else
            {
	            out.print("welcome you!");
	            out.print(session.getAttribute("user")); 
            }
            %>
            </a></p>
            <p><a href="ManagerLogin.jsp">manager login</a></p>
            <p><a href="pwchange.jsp">change your password</a></p>
            <p>Not a member yet,<a href="signup.jsp">register</a> here</p>
            <p><a href="logout.jsp">logoff</a></p>
          </div><!--close sidebar_item--> 
        </div><!--close sidebar-->
      
       </div><!--close sidebar_container-->	
	
	  
	  <div class="slideshow">
	  
	    <ul class="slideshow">
          <li class="show"><img width="680" height="380" src="images/home_2.jpg" alt="&quot;our life&quot;"/></li>
          <li><img width="680" height="380" src="images/home_4.jpg" alt="&quot;welcome you&quot;" /></li>
          <li><img width="680" height="380" src="images/home_6.jpg" alt="&quot;travel&quot;" /></li>
          <li><img width="680" height="380" src="images/home_7.png" alt="&quot;sea&quot;" /></li>
        </ul>
      </div>	  	 
	 
	  <div id="content">
	  
        <div class="content_item">
		  <h1>Welcome To Our Website</h1> 
	      <p>we suggest a new approach to develop a collaborative learning environment for learning software patterns 
	         that uses existing Learning Management Systems (LMSs), domain-specific tools for software modeling and relevant 
	         repositories of software patterns available online. All these elements connected together establish an integrated
	         learning framework, called DEPTHS, that supports collaborative learning of software patterns. We propose the use
	         of Learning Object Context Ontology (LOCO) framework as an ontology base for the integration.
	         This is a generic framework capable of formally representing diverse kinds of learning situations 
	         (i.e., learning contexts). Accordingly, the framework integrates a number of learning-related ontologies, 
	         such as a user model ontology, a learning content ontology, and domain ontologies. </p>	  
		  
		  <div class="content_image">
		    <img src="images/content_image5.jpg" width="180px" alt="&quot;my friends&quot;"/>
	      </div>
		 
		  <p>In order to fully respond to 
	         the above mentioned requirements for high-quality education in the domain of software patterns, 
	         we rely on the LOCO framework in the following manner: we use a domain ontology for representing 
	         the domain of software patterns and the extended learning context ontology for capturing and representation 
	         of learning contexts of different kind of systems and tools that DEPTHS integrates.</p>
		  
		  <br style="clear:both"/>
		  
		  <div class="content_container">
		    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque cursus tempor enim.
		     Aliquam facilisis neque non nunc posuere eget volutpat metus tincidunt.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque cursus tempor enim. Aliquam facilisis neque non nunc posuere eget volutpat metus tincidunt.</p>
		  	<div class="button_small">
		      <a href="#">Read more</a>
		    </div><!--close button_small-->
		  </div><!--close content_container-->
         
          <div class="content_container">
          
		    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque cursus tempor enim. Aliquam facilisis neque non nunc posuere eget volutpat metus tincidunt.
		       Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque cursus tempor enim. Aliquam facilisis neque non nunc posuere eget volutpat metus tincidunt</p>          
		  	<div class="button_small">
		      <a href="#">Read more</a>
		    </div><!--close button_small-->		  
		 
		  </div><!--close content_container-->			  
		
		</div><!--close content_item-->
      
      </div><!--close content-->   
	</div><!--close site_content--> 
    
	
	<div id="content_bottom">
	
	  <div class="content_bottom_container_box">
		<h4>Latest Blog Post</h4>
	    <p> Phasellus laoreet feugiat risus. Ut tincidunt, ante vel fermentum iaculis.</p>
		<div class="readmore">
		  <a href="http://write.blog.csdn.net/postlist">Read more</a>
		  <p>&nbsp;</p>
		</div><!--close readmore-->
	 
	  </div><!--close content_bottom_container_box-->
     
      <div class="content_bottom_container_box">
       <h4>Latest News</h4>
	    <p> Phasellus laoreet feugiat risus. Ut tincidunt, ante vel fermentum iaculis.</p>
	  
	    <div class="readmore">
		  <a href="http://goodoldai.org/">Read more</a>
		  <p>&nbsp;</p>
		  
		</div><!--close readmore-->
	  </div><!--close content_bottom_container_box-->
    
      <div class="content_bottom_container_boxl">
		<h4>Latest Projects</h4>
	    <p> Phasellus laoreet feugiat risus. Ut tincidunt, ante vel fermentum iaculis.</p>
	    <div class="readmore">
		  <a href="#">Read more</a>
		</div><!--close readmore-->	  
	  </div><!--close content_bottom_container_box1-->      
	
	  <br style="clear:both"/>
    </div><!--close content_bottom-->   
 
  </div><!--close main-->
  
  
  <div id="footer">
	  <a href="index.jsp">Home</a> | <a href="ourwork.html">Our Work</a> | <a href="testimonials.html">Testimonials</a> | <a href="projects.html">Projects</a> | <a href="contact.html">Contact</a><br/><br/>
	  <p>Copyright ©<a href="#"> Qiuming Lu</a> 2012-2014. All rights reserved</p>
  </div><!--close footer-->  
  
</body>
</html>
