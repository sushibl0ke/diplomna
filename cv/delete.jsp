<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String Email = request.getParameter("d");
String no = Email;

Connection con;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cv","root","admin");

Statement stat= con.createStatement();
stat.executeUpdate("delete from cv.main where Email='"+no+"'");
response.sendRedirect("management.jsp");

%>
