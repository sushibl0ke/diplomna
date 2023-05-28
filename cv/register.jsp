<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="assets/css/userregister.css">
  <title>CV User Register</title>
  <link rel="stylesheet" media="print" href="assets/userregister.css" />

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

<body class="homepage is-preload">

  <nav id="nav">
     <ul>
     <li><a href="index.jsp">Home</a></li>
     <li><a href="userlogin.jsp">Login</a></li>

  </nav>


  <div id="page-wrapper">
     <div id="header">
        <div class="inner">
          <form action="" method="post">
          <h1>CiVi Register</h1>
          <br>
                  <div class="row">
                      <div> <label>Email </label> <input type="email" class="form-control" name="mail" required></div>
                      <div> <label>Password </label> <input type="password" class="form-control" name="psw" required></div>

                  </div>
                  <br>

                  <button onclick="alert('If not redirected, the email you are using has been already taken!')"  type="submit">Register</button>
               </form>
        </div>
      </div>
  </div>

  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/jquery.dropotron.min.js"></script>
  <script src="assets/js/jquery.scrolly.min.js"></script>
  <script src="assets/js/jquery.scrollex.min.js"></script>
  <script src="assets/js/browser.min.js"></script>
  <script src="assets/js/breakpoints.min.js"></script>
  <script src="assets/js/util.js"></script>
  <script src="assets/js/main.js"></script>

</body>




<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" session="false"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>

<%
        String useremail = request.getParameter("mail");
        String userpassword = request.getParameter("psw");

        try {

            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cv","root","admin");

            String sql = "insert into cv.userslogin(useremail,userpassword) values (?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, useremail);
            ps.setString(2, userpassword);

            ps.executeUpdate();

            String dieirl = "INSERT INTO cv.main VALUES('','','','"+useremail+"','','','','','','','','2001-01-01','','','','');";

            String URL  = "jdbc:mysql://localhost:3306/cv";
            String ID   = "root";
            String Pass = "admin";

            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection Connection = java.sql.DriverManager.getConnection(URL, ID, Pass);
            java.sql.Statement Statement = Connection.createStatement();

            Statement.executeUpdate(dieirl);

            response.sendRedirect("userlogin.jsp");


        } catch (Exception e) {
            System.out.println("Register Error - " + e.getMessage());

    }

%>
