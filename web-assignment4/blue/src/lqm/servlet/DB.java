package lqm.servlet;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;
public class DB
{
	
	public static Vector<String[]> getMessage(String sql)
	{
		Vector<String[]> vtemp = new Vector<String[]>();
		try
		{
			//��ʼ��������
			Context initial = new InitialContext();    
            //����mysqlΪ����Դjndi����      	
            DataSource ds = (DataSource)initial.lookup("java:comp/env/jdbc/blue");
            //�õ�����
            Connection con=ds.getConnection();
            //�������
            Statement st = con.createStatement();
            //ִ�����õ������
            ResultSet rs = st.executeQuery(sql);
            //��ȡ�������Ԫ����
            ResultSetMetaData rsmd = rs.getMetaData();
            //�õ�������е�������
            int count = rsmd.getColumnCount();
            while(rs.next())
            {
            	String[] str = new String[count];
            	for(int i=0;i<count;i++)
            	{
            		str[i] = rs.getString(i+1);
            		str[i] = new String(str[i].getBytes("ISO-8859-1"),"gb2312");
            	}
            	vtemp.add(str);
            }
            rs.close();
            st.close();
            con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return vtemp;
	}
	
	public static boolean selectMsg(String sql)
	{
		boolean flag = false;
		try
		{	
			Context initial = new InitialContext();//��ʼ��������  
            //����mysqlΪ����Դjndi����      	
            DataSource ds = (DataSource)initial.lookup("java:comp/env/jdbc/blue");
            Connection con=ds.getConnection();//�õ�����
            Statement st = con.createStatement();//�������
            ResultSet rs = st.executeQuery(sql); //ִ�����õ������
            if(rs.next())
            {
            	flag = true;
            }			
            rs.close();//�رս����
            st.close();//�ر����
            con.close();//�黹����
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}
	
	
	public static int updateMeg(String sql)
	{
		int flag = 0;
		try
		{	
			Context initial = new InitialContext();                //��ʼ��������    
                                                                   //����mysqlΪ����Դjndi����    
            DataSource ds = (DataSource)initial.lookup("java:comp/env/jdbc/blue");
            
            Connection con=ds.getConnection();                                    //�õ�����
            
            Statement st = con.createStatement();                               //�������
            flag = st.executeUpdate(sql);                                       //���±�
            st.close();                                                         //�ر����
            con.close();                                                        //�黹����		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}

}
