<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@ include file="footer.jsp" %>

<%
if(SessionEmail != null){
%>
<html>
	<head>
		<title>CV Results</title>

 		<script src="assets/js/FileSaver.js"></script>
		<style>
		body{
		width:50%;
		margin: 0 auto;
		padding: 20px;
		border: solid black 2px;
		font-family: 'Source Sans Pro', sans-serif;
	  zoom: 1.2;
	  -moz-transform: scale(1.2);
		}
		</style>
	</head>

	<body>
		<a href="#" onclick="CopyToClipboard('sc');return false;">Copy Resume to Clipboard</a>
		<br>
		<br>
		<div>
		<span id="sc">
		<%
			String clearTable = "DELETE FROM main WHERE Email='"+SessionEmail+"';";
			String checkEmail = "UPDATE main SET Email='"+SessionEmail+"' WHERE Email IS NULL;";

			String Query = "INSERT IGNORE INTO main VALUES(";
			java.util.Map<java.lang.String, java.lang.String[]> Fields = request.getParameterMap();
			if (Fields != null)
			{
				Integer Count = Fields.size();

				Integer Index = 1;

				for (java.util.Map.Entry<java.lang.String, java.lang.String[]> FieldEntry : Fields.entrySet())
				{
					String Value = (FieldEntry.getValue())[0];
					Query += "'" + Value + "'";
					if (Index++ != Count) { Query += ", "; }

					out.println(FieldEntry.getKey() + " - " + Value + "<hr>");

				}
				Query += ");";
			}
			else
			{
				out.println("No map!");
			}


			String URL  = "jdbc:mysql://localhost:3306/cv";
			String ID   = "root";
			String Pass = "admin";

			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection Connection = java.sql.DriverManager.getConnection(URL, ID, Pass);
			java.sql.Statement Statement = Connection.createStatement();
			Statement.executeUpdate(checkEmail);
			Statement.executeUpdate(clearTable);
			Statement.executeUpdate(Query);

		%>
		</span>
	</div>

					<script>
					function CopyToClipboard(sc){

					var r = document.createRange();
					r.selectNode(document.getElementById(sc));
					window.getSelection().removeAllRanges();
					window.getSelection().addRange(r);
					document.execCommand('copy');
					window.getSelection().removeAllRanges();
					}
					</script>

	</body>
</html>

<%
} else {
%>
<h1>You are not logged in!</h1>
<%
}
%>
