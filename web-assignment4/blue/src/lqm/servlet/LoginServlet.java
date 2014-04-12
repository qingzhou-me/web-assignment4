package lqm.servlet;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*; //所要导入的包文件


public class LoginServlet extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	                                              //doGet方法
	throws ServletException,IOException
	{
		this.doPost(request,response);	           //调用doPost方法
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	
	throws ServletException,IOException
	
	{
		request.setCharacterEncoding("GB2312");      //设置请求的编码为GB2312
		response.setCharacterEncoding("GB2312");     //设置响应的编码为GB2312
		response.setContentType("text/html;charset=GB2312");      //设置响应页面的编码格式
		HttpSession session=request.getSession(true);            //拿到session对象
		PrintWriter out=response.getWriter();//拿到输出流对象
		
		class PaginationBean
		{
			
		}
		
		String action=request.getParameter("action");        //获取请求动作
		System.out.println(action);
		if(action==null)
		{
			return;
		}
		if(action.equals("login"))           //如果action为“login”
		{
			String zname=request.getParameter("zname");       //得到用户名
			String zpassword=request.getParameter("zpassword");         //将用户的密码转码
			String cname=new String(zname.getBytes(),"ISO-8859-1");
			//将用户名转码
			String sql="select cname from myusers where cname='"+cname+"'and cpw='"+zpassword+"'";
			boolean s=DB.selectMsg(sql);  //调用selectMsg()方法
			if(s){                        //结果为真的情况
				
				session.setAttribute("user",zname);  //将用户名放进session
				
				String fromWhere=(String)session.getAttribute("fromWhere");
								
				String msg="恭喜你，登录成功！";
				request.setAttribute("msg",msg);
				
				
				this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
				
				    
		    	}		
		     else
		        {
		        	String msg = "对不起,登录失败,请重新登录!!!";
			        request.setAttribute("msg",msg);
			        this.getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);
		        }
						
			}
			
			else if(action.equals("register")){
				System.out.println("register");
				
				String zname = request.getParameter("cname");                   //得到用户名文本框内容
				String zpassword = request.getParameter("cpassword");           //得到用户首次密码文本框内容	
				
				String spw = request.getParameter("spw");                       //得到用户两次密码文本框内容
				String email = request.getParameter("email");                   //得到用户E-mail文本框内容
				
				String cname = new String(zname.getBytes(),"ISO-8859-1");       //将用户名信息转码
				String cpw = new String(zpassword.getBytes(),"ISO-8859-1");     //将用户密码信息转码
				String cemail = new String(email.getBytes(),"ISO-8859-1");      //将用户名E-mail信息转码
				String sql = "select cname from myusers where cname='"+cname+"'";
				                                                                //验证是否有网络重名
				boolean s = DB.selectMsg(sql);                                  //执行查询
				                                                                
				if(s)                                                           //验证结果是否为真
				{
					String msg ="网络有重名，请重新注册！！";                          //提示信息
					request.setAttribute("msg",msg);                             //设置请求参数
					
					this.getServletContext().getRequestDispatcher("/signup.jsp").forward(request,response);
					//页面跳转
					
				}
				
				else{
					//验证结果不为真
					String sql0 = "insert into myusers(cname,cpw,cemail)"+" values('"+cname+"','"+cpw+"','"+cemail+"')";
					int flag=DB.updateMeg(sql0);                       //插入用户信息
					
					if(flag==0)	                                       //插入失败
					{
						String msg = "注册失败，请重新注册！！";             //失败提示信息
						request.setAttribute("msg",msg);               //设置请求参数
						
						this.getServletContext().getRequestDispatcher("/register.jsp").forward(request,response);
						//页面跳转
						
					}
					
					else{
						session.setAttribute("user",cname);
						//设置请求中的用户名参数
						String msg="恭喜你，注册成功！";
						
						this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
					}
				}
			}
		
			else if(action.equals("resetpwd"))                          //重置密码时
				
	    	{   
	    		String aname = (String)session.getAttribute("user");               //从session中得到用户名
	    		String apwd = request.getParameter("apwd").trim();                 //得到用户的新密码
	    		
	    		String temp = "select * from myusers where cname='"+aname+"'";      //验证用户身份
	    		
	    		temp = new String(temp.getBytes(),"ISO-8859-1");                    //给SQL语句转码
	    		
	    		boolean flag = DB.selectMsg(temp);                                  //执行检索
	    		
	    		String msg = "";
	    		
	    		if(!flag)
	    		{
	    			msg = "对不起,用户名错误！";                                         //检索失败进行提示
	    		}
	    		
	    		else
	    		{
	    			String sql = "update myusers set cpw='"+apwd+"' where cname='"+aname+"'";
	    			                                                                 //更新用户密码
	    			sql = new String(sql.getBytes(),"ISO-8859-1");                   //将SQL转码
	    			
	    			int i = DB.updateMeg(sql);                                       //执行更新
	    			if(i==1)
	    			{
	    				msg="恭喜您,密码修改成功！";                                      //更新成功提示
	    			}
	    			else
	    			{
	    				msg = "对不起,密码修改失败！";    				         
	    			}
	    		}
	    		request.setAttribute("msg",msg);
	    		this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
	    	}
		
			else if(action.equals("logout"))
			{
				//当用户注销登录时
	    		//使session失效
	    		request.getSession(true).invalidate();
	    		response.sendRedirect("index.jsp");
	    	}
		
		
			else if(action.equals("comment")){
				System.out.println("comment");
				
				String zname = request.getParameter("username");                   //得到用户名文本框内容	
				
				String email = request.getParameter("email");                   //得到用户E-mail文本框内容
				
			    String http = request.getParameter("url");                   //得到用户http文本框内容
			    
			    String comment = request.getParameter("comment");                   //得到用户comment文本框内容
				
				String cname = new String(zname.getBytes(),"ISO-8859-1");       //将用户名信息转码
				
				String cemail = new String(email.getBytes(),"ISO-8859-1");      //将用户名E-mail信息转码
				
				String chttp = new String(http.getBytes(),"ISO-8859-1");   
				
				String ccomment= new String(comment.getBytes(),"ISO-8859-1"); 
					
			    String sql0 = "insert into comment(name,email,http,comment)"+" values('"+cname+"','"+cemail+"','"+chttp+"','"+ccomment+"')";
			    
				int flag=DB.updateMeg(sql0);                       //插入用户信息
					
					if(flag==0)	                                       //插入失败
					{
						String msg = "评论失败，请重新评论！！";             //失败提示信息
						request.setAttribute("msg",msg);               //设置请求参数
						
						this.getServletContext().getRequestDispatcher("/comment.jsp").forward(request,response);
						//页面跳转
						
					}
					
					else{
						
						String msg="恭喜你，评论成功！";
						
						this.getServletContext().getRequestDispatcher("/ourwork.html").forward(request,response);
						}
					}
		}
			
}
		
	


