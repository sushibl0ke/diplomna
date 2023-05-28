<%@ include file="footerAdmin.jsp" %>

<%

if (SessionUsername!=null){

%>


<html>
  <head>
    <title>CV Admin Management Page</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/main.css">

    <link rel="stylesheet" media="print" href="assets/main.css" />

    <style>

    body {
      background-color: #151422;
    }


    </style>

  </head>
<body>
<style>

.divtable {
  width: 40%;
  margin-left: 50px;

}

table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 200%;
  table-layout: fixed;

}

td, th {
  border: 1px solid #2a224d;
  text-align: center;
  padding: 8px;
  white-space:nowrap;
  overflow:hidden;
  text-overflow:ellipsis;
  min-height: 100%;
  color: black;
    background-color: white;
}



th {
  background-color: #dddddd;
  text-align: center;
  font-size: 80%;
}


</style>
<br>

<div style="margin-left: 50px;">
<h2 style="color: white; "> CiVi Management - Logged in as: Vlad</h2><br><a style="color:black;" href="logout.jsp"><button>Logout</button></a>
</div>

<div class="divtable">

  <br>
  <br>
    <table >
    <thead>
        <tr>
            <th>F Name</th>
            <th>L Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>City</th>
            <th>Address</th>
            <th>Post Code</th>
            <th>Birthplace</th>
            <th>Birthdate</th>

        </tr>
    </thead>
    <tbody>

    <%
    Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cv","root","admin");
    String sql="select * from cv.main order by FirstName";
    Statement stat = null;
    ResultSet res = null;
    stat= con.createStatement();
    res = stat.executeQuery(sql);
    while(res.next()){
    %>
    <tr>

        <td class="content_td"><%= res.getString("FirstName") %></td>
        <td class="content_td"><%= res.getString("LastName") %></td>
        <td class="content_td"><%= res.getString("Email") %></td>
        <td class="content_td"><%= res.getString("Phone") %></td>
        <td class="content_td"><%= res.getString("City") %></td>
        <td class="content_td"><%= res.getString("Address") %></td>
        <td class="content_td"><%= res.getString("PostalCode") %></td>
        <td class="content_td"><%= res.getString("PlaceOfBirth") %></td>
        <td class="content_td"><%= res.getString("DateOfBirth") %></td>


        <td style="text-align: left; border-style: none; background-color:transparent">
        <a href ='delete.jsp?d=<%=res.getString("Email")%>' style="color:black;"><button>Delete</button></a>
        </td>

    </tr>

    <%
    }
    %>

    </tbody>
</table>
</div>
<br>

<div class="divtable">
    <table >
    <thead>
        <tr>
            <th>Username</th>
            <th>Password</th>

        </tr>
    </thead>
    <tbody>

    <%
    Connection con2;
    Class.forName("com.mysql.jdbc.Driver");
    con2= DriverManager.getConnection("jdbc:mysql://localhost:3306/cv","root","admin");
    String sql2="select * from cv.userslogin order by useremail";
    Statement stat2 = null;
    ResultSet res2 = null;
    stat2= con2.createStatement();
    res2 = stat2.executeQuery(sql2);
    while(res2.next()){
    %>
    <tr>
        <td class="content_td"><%= res2.getString("useremail") %></td>
        <td class="content_td"><%= res2.getString("userpassword") %></td>

        <td style="text-align: left; border-style: none; background-color:transparent">
        <a href ='deleteusers.jsp?d=<%=res2.getString("useremail")%>' style="color:black;"><button>Delete</button></a>
        </td>
    </tr>

    <%
    }
    %>

    </tbody>
</table>
</div>

</body>
</html>

<%
} else {

response.sendRedirect("errorAdmin.jsp");
}
%>
