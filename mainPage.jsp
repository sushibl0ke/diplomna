<%@ include file="footer.jsp" %>


		<%
		if(SessionEmail != null){
			Connection con;
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cv","root","admin");
			String u = request.getParameter("u");
			String sql = "select * from cv.main where Email='"+u+"'";
			System.out.println(sql);
			Statement stat = null;
			ResultSet res = null;
			stat= con.createStatement();
			res = stat.executeQuery(sql);

    %>
		<!DOCTYPE html>
		<html>
			<head>
				<title>CV Maker</title>

				<style>
					body{
					width:50%;
					margin: 0 auto;
					background: rgb(2,0,36);
					background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(49,49,71,1) 50%, rgba(2,0,36,1) 100%);
					}
					label { display:inline-block; margin-right:40px; font-weight:bold; width:150px; }

				</style>


				<meta charset="UTF-8">
				<meta http-equiv="X-UA-Compatible" content="IE=edge">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<link rel="stylesheet" href="assets/css/style.css">

				<link rel="stylesheet" media="print" href="assets/style.css" />

				<br>
				<input type="file" id="image_input">
				<button for="file" class="btnStyle no-print" id="imageButton" onclick="image_input.click()">Select Image</button>
				<button title="button title" id="button2" class="btnStyle no-print" onclick=" window.open('index.jsp', '_blank'); return false;">Home</button>
				<input type="button" id="button3" class="btnStyle no-print" onclick="window.print()" value="Print PDF"/>
				<input type="button" id="button4" class="btnStyle no-print" onclick="document.getElementById('formButton').click()" value="Save and Copy" />

			</head>

	<body>
		<div id="dvContents">
		<div class="bg">
		<form type="POST" action="submit.jsp" target="_blank">

			<%
			while(res.next()){
			%>

			<fieldset>
			 <br>
			 <div id="display_image"></div>
			 <br>
			 <hr>
			 <label>Desired Job Title<br>

 			<input required type="text" name="WantedJobTitle" value="<%=res.getString("WantedJobTitle")%>"><br>
 			</label>
			<br>
 			<label>First Name<br>
 			<input required type="text" name="FirstName" value="<%=res.getString("FirstName")%>"><br>
 			</label>
			<br>
 			<label>Last Name<br>
 			<input required type="text" name="LastName" value="<%=res.getString("LastName")%>"><br>
 			</label>

			<br><br>

 			<label><img src="images/email.png" width="23" height="23">  Email<br>
 			<input readonly required type="email" name="Email" value="<%out.println(u);%>"><br>
 			</label>
 			<br><br>
 			<label><img src="images/phone.png" width="23" height="23">  Phone<br>
 			<input required type="tel" name="Phone" value="<%=res.getString("Phone")%>" maxlength="16"><br>
 			</label>
			<br><br>
 			<label><img src="images/gps.png" width="23" height="23">  Country<br>
 			<input required type="text" name="Country" value="<%=res.getString("Country")%>"><br>
 			</label>
			<br><br>
			<hr>
			<br>
 			<label>City<br>
 			  <input required type="text" name="City" value="<%=res.getString("City")%>"><br>
 			</label>


				<label>Address<br>
				<input required type="text" name="Address" value="<%=res.getString("Address")%>"><br>
				</label>

				<label>Postal Code<br>
				<input required type="text" name="PostalCode" value="<%=res.getString("PostalCode")%>" maxlength="16"><br>
				</label>

				<label>Nationality<br>
				<input required type="text" name="Nationality" value="<%=res.getString("Nationality")%>" maxlength="32"><br>
				</label>

				<label>Place Of Birth<br>
				<input required type="text" name="PlaceOfBirth" value="<%=res.getString("PlaceOfBirth")%>" maxlength="64"><br>
				</label>

				<label>Date Of Birth<br>
				<input required type="date" name="DateOfBirth" value="<%=res.getString("DateOfBirth")%>"><br>
				</label>

				<br><br><br>
			</fieldset>


			<fieldset>
			<h3>Professional Summary</h3>
			<textarea required name="ProfessionalSummary" rows="8" cols="35" maxlength="512"><%=res.getString("ProfessionalSummary")%></textarea>

			<h3>Education</h3>
			<textarea required name="Education" rows="8" cols="35" maxlength="512"><%=res.getString("Education")%></textarea>

			<h3>Portfolio</h3>
			<textarea required name="Portfolio" rows="8" cols="35" maxlength="200"><%=res.getString("Portfolio")%></textarea>

			<h3>Skills</h3>
			<textarea required name="Skills" rows="8" cols="35" maxlength="200"><%=res.getString("Skills")%></textarea>


		</fieldset>

		<%
	}
		%>

		</div>
 </div>

 <input type="submit" id="formButton" hidden>

 </form>

 <br><br>

	 	<script src="assets/js/input_image.js"></script>


	</body>
</html>

	<%
	} else {

	response.sendRedirect("error.jsp");
	}
	%>
