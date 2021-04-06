package com.tu.chaebun;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public abstract class ConnProperty 
{
	private static final String CLASS_FORNAME 
			= "oracle.jdbc.driver.OracleDriver";
	private static final String JDBC_URL 
			= "jdbc:oracle:thin:@db-tripus.c4vvtykvtzsk.ap-northeast-2.rds.amazonaws.com:1521:TRIPUS";	
	private static final String JDBC_USER = "admin";
	private static final String JDBC_PASS = "mypassword";

	
	public static Connection getConnection() throws Exception
	{
		Connection conn = null;
		Class.forName(CLASS_FORNAME);		
		conn = DriverManager.getConnection( JDBC_URL
			                                 ,JDBC_USER
			                                 ,JDBC_PASS);	
		
		return conn;
	}

	public static void conClose(Connection conn
			                   ,PreparedStatement pstmt 
			                   ,ResultSet rsRs) 
	{
		try
		{
			if (rsRs != null) try { rsRs.close(); rsRs = null; } catch(Exception ex){}
			if (pstmt != null) try { pstmt.close(); pstmt = null; } catch(Exception ex){}
			if (conn != null) try { conn.close(); conn = null; } catch(Exception ex){}
		}
		catch (Exception e2){}			
	}

	public static void conClose(Connection conn, PreparedStatement pstmt) 
	{
		try
		{
			if (pstmt != null) try { pstmt.close(); pstmt = null; } catch(Exception ex){}
			if (conn != null) try { conn.close(); conn = null; } catch(Exception ex){}
		}
		catch (Exception e2){}			
	}
}