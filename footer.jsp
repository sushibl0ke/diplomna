<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>

      <footer style="position:absolute; height: 0px;">

      </footer>

<%
HttpSession session5 = request.getSession(false);
Connection con5;
Class.forName("com.mysql.jdbc.Driver");
con5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cv","root","admin");
String SessionEmail = (String) session5.getAttribute("useremail");


if (session5.getAttribute("useremail") == null || session5.getAttribute("useremail").equals("")) {

  System.out.println("NO LOGGED IN USER");
} else if (session5.getAttribute("useremail") != null) {

  System.out.println("LOGGED IN AS: "+session5.getAttribute("useremail"));
}

%>
