package lqm.servlet;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*; //��Ҫ����İ��ļ�


public class ManagerServlet extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	                                              //doGet����
	throws ServletException,IOException
	{
		this.doPost(request,response);	           //����doPost����
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	
	throws ServletException,IOException
	
	{
		request.setCharacterEncoding("GB2312");      //��������ı���ΪGB2312
		response.setCharacterEncoding("GB2312");     //������Ӧ�ı���ΪGB2312
		response.setContentType("text/html;charset=GB2312");      //������Ӧҳ��ı����ʽ
		HttpSession session=request.getSession(true);            //�õ�session����
		PrintWriter out=response.getWriter();		             //�õ����������
		
		String action=request.getParameter("action");        //��ȡ������
		System.out.println(action);
		if(action==null)
		{
			return;
		}
		if(action.equals("managerlogin"))           //���actionΪ��login��
		{
			String zname=request.getParameter("mname");       //�õ��û���
			String zpassword=request.getParameter("mpassword");         //���û�������ת��
			String cname=new String(zname.getBytes(),"ISO-8859-1");
			//���û���ת��
			String sql="select mname from mmanager where mname='"+cname+"'and mpw='"+zpassword+"'";
			boolean s=DB.selectMsg(sql);  //����selectMsg()����
			if(s){                        //���Ϊ������
				
				session.setAttribute("user",zname);  //���û����Ž�session
				
				String msg="��ϲ�㣬��¼�ɹ���";
				request.setAttribute("msg",msg);
				
				this.getServletContext().getRequestDispatcher("/Manager.html").forward(request,response);
				
				    
		    	}		
		     else
		        {
		        	String msg = "�Բ���,��¼ʧ��,�����µ�¼!!!";
			        request.setAttribute("msg",msg);
			        this.getServletContext().getRequestDispatcher("/ManagerLogin.jsp").forward(request,response);
		        }
						
			}			
		
			else if(action.equals("managerlogout"))
			{
				//���û�ע����¼ʱ
	    		//ʹsessionʧЧ
	    		request.getSession(true).invalidate();
	    		response.sendRedirect("index.jsp");
	    	}
			
		}
		
	}

