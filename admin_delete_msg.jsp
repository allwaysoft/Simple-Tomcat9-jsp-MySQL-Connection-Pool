<%-- 
    Document   : admin_delete_msg
    Created on : 1 Apr, 2018, 5:39:36 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*" %>

<%

    		Context initCtx = new InitialContext();
    		DataSource ds =(DataSource)initCtx.lookup("java:comp/env/jdbc/dbblooddonor");


         if(ds!=null){ 
         	Connection con  = null;  
        
          try
                 {
                    con  = ds.getConnection();     
                    
            
               Statement st=con.createStatement();
               String qry="delete from feedback where fid='"+request.getParameter("fid")+"'";

               if(st.executeUpdate(qry)==1)
               {
                   response.sendRedirect("admin_messages.jsp");
               }
               else
               {
                   out.println("<br/><br/>Item have error to delete");
               }

                 		//rs.close();
                 		st.close();
                     con.close();            
           }catch(Exception sb)
           {
               out.println("<br/><br/>Error is "+sb.getMessage().toString());
           }finally {
            			if (con != null) con.close();
        				}
        	}



%>