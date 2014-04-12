package lqm.servlet;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*; //所要导入的包文件


public class ManagerServlet extends HttpServlet
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
		PrintWriter out=response.getWriter();		             //拿到输出流对象
		
		String action=request.getParameter("action");        //获取请求动作
		System.out.println(action);
		if(action==null)
		{
			return;
		}
		if(action.equals("managerlogin"))           //如果action为“login”
		{
			String zname=request.getParameter("mname");       //得到用户名
			String zpassword=request.getParameter("mpassword");         //将用户的密码转码
			String cname=new String(zname.getBytes(),"ISO-8859-1");
			//将用户名转码
			String sql="select mname from mmanager where mname='"+cname+"'and mpw='"+zpassword+"'";
			boolean s=DB.selectMsg(sql);  //调用selectMsg()方法
			if(s){                        //结果为真的情况
				
				session.setAttribute("user",zname);  //将用户名放进session
				
				String msg="恭喜你，登录成功！";
				request.setAttribute("msg",msg);
				
				this.getServletContext().getRequestDispatcher("/Manager.html").forward(request,response);
				
				    
		    	}		
		     else
		        {
		        	String msg = "对不起,登录失败,请重新登录!!!";
			        request.setAttribute("msg",msg);
			        this.getServletContext().getRequestDispatcher("/ManagerLogin.jsp").forward(request,response);
		        }
						
			}			
		
			else if(action.equals("managerlogout"))
			{
				//当用户注销登录时
	    		//使session失效
	    		request.getSession(true).invalidate();
	    		response.sendRedirect("index.jsp");
	    	}
			
		}
		
	}

