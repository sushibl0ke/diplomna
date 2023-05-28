<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="assets/css/main.css">
  <title>CV Admin Login</title>
  <link rel="stylesheet" media="print" href="assets/main.css" />

  <style>

.row {
  padding: 10px;
  text-align:center;

}
.inner {
  align-items: center;
  transform: scale(1.3);
}

  </style>
</head>

<body class="is-preload homepage">

  <nav id="nav">
     <ul>
     <li><a href="index.jsp">Home</a></li>

  </nav>

  <div id="page-wrapper">
     <div id="header">
        <div class="inner">
          <form action="" method="post">
          <h1>CiVi Admin Login</h1>
          <br>
                  <div class="row">
                      <div><label>Username</label> <input type="text" class="form-control" name="uname" required> </div>
                      <div><label>Password</label> <input type="password" class="form-control" name="psw" required> </div>

                  </div>
                  <br>

                  <button type="submit">Login</button>
               </form>
        </div>
      </div>
  </div>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="false"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>

<%
        String username = request.getParameter("uname");
        String password = request.getParameter("psw");

        try {
            HttpSession session1 = request.getSession(false);
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cv","root","admin");
            System.out.println("Connected Login part");

            String sql = "select * from cv.login where username=? and password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            String unameDB="";
            String passDB="";
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                unameDB = rs.getString("username");
                passDB = rs.getString("password");
                System.out.println("Database username ::: " +unameDB);
                System.out.println("Database password ::: " +passDB);
            }
            if(username.equals(unameDB) && password.equals(passDB)) {

                response.sendRedirect("management.jsp");

                session1.setAttribute("username", username);
            } else {
                System.out.println("Couldn't log in as ADMIN");

            }

        } catch (Exception e) {
            System.out.println("Error from Admin Login: " + e.getMessage());
        }

%>
