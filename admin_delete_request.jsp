<%-- 
    Document   : admin_delete_request
    Created on : 31 Mar, 2018, 3:36:07 PM
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
               String qry="delete from bloodrequest where bid='"+request.getParameter("bid")+"'";               

               if(st.executeUpdate(qry)==1)
               {
                   response.sendRedirect("admin_bloodrequest.jsp");
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