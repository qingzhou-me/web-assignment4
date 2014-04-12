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
			//初始化上下文
			Context initial = new InitialContext();    
            //其中mysql为数据源jndi名称      	
            DataSource ds = (DataSource)initial.lookup("java:comp/env/jdbc/blue");
            //得到连接
            Connection con=ds.getConnection();
            //声明语句
            Statement st = con.createStatement();
            //执行语句得到结果集
            ResultSet rs = st.executeQuery(sql);
            //获取结果集的元数据
            ResultSetMetaData rsmd = rs.getMetaData();
            //得到结果集中的总列数
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
			Context initial = new InitialContext();//初始化上下文  
            //其中mysql为数据源jndi名称      	
            DataSource ds = (DataSource)initial.lookup("java:comp/env/jdbc/blue");
            Connection con=ds.getConnection();//得到连接
            Statement st = con.createStatement();//声明语句
            ResultSet rs = st.executeQuery(sql); //执行语句得到结果集
            if(rs.next())
            {
            	flag = true;
            }			
            rs.close();//关闭结果集
            st.close();//关闭语句
            con.close();//归还连接
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
			Context initial = new InitialContext();                //初始化上下文    
                                                                   //其中mysql为数据源jndi名称    
            DataSource ds = (DataSource)initial.lookup("java:comp/env/jdbc/blue");
            
            Connection con=ds.getConnection();                                    //得到连接
            
            Statement st = con.createStatement();                               //声明语句
            flag = st.executeUpdate(sql);                                       //更新表
            st.close();                                                         //关闭语句
            con.close();                                                        //归还连接		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return flag;
	}

}
