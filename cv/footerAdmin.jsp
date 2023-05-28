<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>

<footer style="position:absolute; height: 0px;">

</footer>

<%
HttpSession session3 = request.getSession(false);
Connection con3;
Class.forName("com.mysql.jdbc.Driver");
con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cv","root","admin");
String SessionUsername = (String) session3.getAttribute("username");

if (session3.getAttribute("username") == null || session3.getAttribute("username").equals("")) {

  System.out.println("NO LOGGED IN ADMIN");
} else if (session3.getAttribute("username") != null) {

  System.out.println("ADMIN LOGGED IN AS: "+session3.getAttribute("username"));
}

%>
