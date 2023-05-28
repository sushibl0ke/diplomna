<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String Email2 = request.getParameter("d");
String no2 = Email2;

Connection con2;
Class.forName("com.mysql.jdbc.Driver");
con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cv","root","admin");

Statement stat2= con2.createStatement();
stat2.executeUpdate("delete from cv.userslogin where useremail='"+no2+"'");
response.sendRedirect("management.jsp");

%>
