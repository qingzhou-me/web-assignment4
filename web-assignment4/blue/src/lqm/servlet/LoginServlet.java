package lqm.servlet;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*; //��Ҫ����İ��ļ�


public class LoginServlet extends HttpServlet
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
		PrintWriter out=response.getWriter();//�õ����������
		
		class PaginationBean
		{
			
		}
		
		String action=request.getParameter("action");        //��ȡ������
		System.out.println(action);
		if(action==null)
		{
			return;
		}
		if(action.equals("login"))           //���actionΪ��login��
		{
			String zname=request.getParameter("zname");       //�õ��û���
			String zpassword=request.getParameter("zpassword");         //���û�������ת��
			String cname=new String(zname.getBytes(),"ISO-8859-1");
			//���û���ת��
			String sql="select cname from myusers where cname='"+cname+"'and cpw='"+zpassword+"'";
			boolean s=DB.selectMsg(sql);  //����selectMsg()����
			if(s){                        //���Ϊ������
				
				session.setAttribute("user",zname);  //���û����Ž�session
				
				String fromWhere=(String)session.getAttribute("fromWhere");
								
				String msg="��ϲ�㣬��¼�ɹ���";
				request.setAttribute("msg",msg);
				
				
				this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
				
				    
		    	}		
		     else
		        {
		        	String msg = "�Բ���,��¼ʧ��,�����µ�¼!!!";
			        request.setAttribute("msg",msg);
			        this.getServletContext().getRequestDispatcher("/login.jsp").forward(request,response);
		        }
						
			}
			
			else if(action.equals("register")){
				System.out.println("register");
				
				String zname = request.getParameter("cname");                   //�õ��û����ı�������
				String zpassword = request.getParameter("cpassword");           //�õ��û��״������ı�������	
				
				String spw = request.getParameter("spw");                       //�õ��û����������ı�������
				String email = request.getParameter("email");                   //�õ��û�E-mail�ı�������
				
				String cname = new String(zname.getBytes(),"ISO-8859-1");       //���û�����Ϣת��
				String cpw = new String(zpassword.getBytes(),"ISO-8859-1");     //���û�������Ϣת��
				String cemail = new String(email.getBytes(),"ISO-8859-1");      //���û���E-mail��Ϣת��
				String sql = "select cname from myusers where cname='"+cname+"'";
				                                                                //��֤�Ƿ�����������
				boolean s = DB.selectMsg(sql);                                  //ִ�в�ѯ
				                                                                
				if(s)                                                           //��֤����Ƿ�Ϊ��
				{
					String msg ="������������������ע�ᣡ��";                          //��ʾ��Ϣ
					request.setAttribute("msg",msg);                             //�����������
					
					this.getServletContext().getRequestDispatcher("/signup.jsp").forward(request,response);
					//ҳ����ת
					
				}
				
				else{
					//��֤�����Ϊ��
					String sql0 = "insert into myusers(cname,cpw,cemail)"+" values('"+cname+"','"+cpw+"','"+cemail+"')";
					int flag=DB.updateMeg(sql0);                       //�����û���Ϣ
					
					if(flag==0)	                                       //����ʧ��
					{
						String msg = "ע��ʧ�ܣ�������ע�ᣡ��";             //ʧ����ʾ��Ϣ
						request.setAttribute("msg",msg);               //�����������
						
						this.getServletContext().getRequestDispatcher("/register.jsp").forward(request,response);
						//ҳ����ת
						
					}
					
					else{
						session.setAttribute("user",cname);
						//���������е��û�������
						String msg="��ϲ�㣬ע��ɹ���";
						
						this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
					}
				}
			}
		
			else if(action.equals("resetpwd"))                          //��������ʱ
				
	    	{   
	    		String aname = (String)session.getAttribute("user");               //��session�еõ��û���
	    		String apwd = request.getParameter("apwd").trim();                 //�õ��û���������
	    		
	    		String temp = "select * from myusers where cname='"+aname+"'";      //��֤�û����
	    		
	    		temp = new String(temp.getBytes(),"ISO-8859-1");                    //��SQL���ת��
	    		
	    		boolean flag = DB.selectMsg(temp);                                  //ִ�м���
	    		
	    		String msg = "";
	    		
	    		if(!flag)
	    		{
	    			msg = "�Բ���,�û�������";                                         //����ʧ�ܽ�����ʾ
	    		}
	    		
	    		else
	    		{
	    			String sql = "update myusers set cpw='"+apwd+"' where cname='"+aname+"'";
	    			                                                                 //�����û�����
	    			sql = new String(sql.getBytes(),"ISO-8859-1");                   //��SQLת��
	    			
	    			int i = DB.updateMeg(sql);                                       //ִ�и���
	    			if(i==1)
	    			{
	    				msg="��ϲ��,�����޸ĳɹ���";                                      //���³ɹ���ʾ
	    			}
	    			else
	    			{
	    				msg = "�Բ���,�����޸�ʧ�ܣ�";    				         
	    			}
	    		}
	    		request.setAttribute("msg",msg);
	    		this.getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
	    	}
		
			else if(action.equals("logout"))
			{
				//���û�ע����¼ʱ
	    		//ʹsessionʧЧ
	    		request.getSession(true).invalidate();
	    		response.sendRedirect("index.jsp");
	    	}
		
		
			else if(action.equals("comment")){
				System.out.println("comment");
				
				String zname = request.getParameter("username");                   //�õ��û����ı�������	
				
				String email = request.getParameter("email");                   //�õ��û�E-mail�ı�������
				
			    String http = request.getParameter("url");                   //�õ��û�http�ı�������
			    
			    String comment = request.getParameter("comment");                   //�õ��û�comment�ı�������
				
				String cname = new String(zname.getBytes(),"ISO-8859-1");       //���û�����Ϣת��
				
				String cemail = new String(email.getBytes(),"ISO-8859-1");      //���û���E-mail��Ϣת��
				
				String chttp = new String(http.getBytes(),"ISO-8859-1");   
				
				String ccomment= new String(comment.getBytes(),"ISO-8859-1"); 
					
			    String sql0 = "insert into comment(name,email,http,comment)"+" values('"+cname+"','"+cemail+"','"+chttp+"','"+ccomment+"')";
			    
				int flag=DB.updateMeg(sql0);                       //�����û���Ϣ
					
					if(flag==0)	                                       //����ʧ��
					{
						String msg = "����ʧ�ܣ����������ۣ���";             //ʧ����ʾ��Ϣ
						request.setAttribute("msg",msg);               //�����������
						
						this.getServletContext().getRequestDispatcher("/comment.jsp").forward(request,response);
						//ҳ����ת
						
					}
					
					else{
						
						String msg="��ϲ�㣬���۳ɹ���";
						
						this.getServletContext().getRequestDispatcher("/ourwork.html").forward(request,response);
						}
					}
		}
			
}
		
	


