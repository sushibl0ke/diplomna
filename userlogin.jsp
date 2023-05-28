<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="assets/css/userlogin.css">
  <title>CV User Login</title>
  <link rel="stylesheet" media="print" href="assets/userlogin.css" />

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
     <li><a href="register.jsp">Register</a></li>

  </nav>

  <div id="page-wrapper">
     <div id="header">
        <div class="inner">
          <form action="" method="post">
          <h1>CiVi Login</h1>
          <br>
                  <div class="row">

                      <div> <label>Email</label> <input type="email" class="form-control" name="mail" required> </div>
                      <div> <label>Password</label> <input type="password" class="form-control" name="psw" required> </div>

                  </div>
                  <br>

                  <button onclick="alert('If not redirected, the account information provided does not exist.')" type="submit">Login</button>
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
        String email = request.getParameter("mail");
        String password = request.getParameter("psw");

        try {
            HttpSession session1 = request.getSession(false);
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cv","root","admin");
            System.out.println("Connected Login part");

            String sql = "select * from cv.userslogin where useremail=? and userpassword=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            String emailDB="";
            String passDB="";
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                emailDB = rs.getString("useremail");
                passDB = rs.getString("userpassword");
                System.out.println("Database username ::: " +emailDB);
                System.out.println("Database password ::: " +passDB);
            }
            if(email.equals(emailDB) && password.equals(passDB)) {

                response.sendRedirect("index.jsp");

                session1.setAttribute("useremail", email);

            } else {

                System.out.println("User couldn't login");
            }

        } catch (Exception e) {
            System.out.println("User couldn't log in: " + e.getMessage());
        }

%>
