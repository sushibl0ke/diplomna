<%@ include file="footer.jsp" %>
<!DOCTYPE HTML>
<html>
   <head>
      <title>CV</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
      <style>
         body {
         background: rgb(2,0,36);
         background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(49,49,71,1) 50%, rgba(2,0,36,1) 100%);
         }
      </style>
   </head>
   <body class="homepage is-preload">

      <div id="page-wrapper">
         <div id="header">
            <div class="inner">
               <header>
                  <h1><a id="logo">CiVi</a></h1>
                  <hr />
                  <p>A free resume generator using templates</p>
               </header>
               <footer>
                  <a href="#features" class="button circled scrolly">Start</a>
               </footer>
            </div>

            <%
            if (session.getAttribute("useremail") == null || session.getAttribute("useremail").equals("")) {

            %>

            <nav id="nav">
               <ul>
               <li><a href="index.jsp">Home</a></li>
               <li><a href="#about" class="scrolly">About</a></li>
               <li><a href="userlogin.jsp">Login</a></li>
               <li><a href="register.jsp">Register</a></li>

            </nav>


            <%
            } else if (session.getAttribute("useremail") != null) {
            %>

            <nav id="nav">
               <ul>
               <li><a href="index.jsp">Home</a></li>
               <li><a href="#about" class="scrolly">About</a></li>
               <li><a href="logout.jsp">Logout</a></li>
               <p style="text-align:center; padding:10px">Logged in as: <%out.println(SessionEmail);%></p>

            </nav>


            <%
            }
            %>

         </div class="img-hover-zoom">
         <!-- features/templates -->
         <section id="features" class="container special" style="margin-bottom:-30px">
         <hr style="width:50%;text-align:center;margin-center:0">
         </br>
         <header>
         <h2 style="color: white; margin-top:-40px; ">Choose a template</h2>
         <p>Choose between our free templates.</p>
         </header>

         <%
         if (session.getAttribute("useremail") == null || session.getAttribute("useremail").equals("")) {

         %>

         <div class="row">
         <article class="col-4 col-12-mobile special zoom">
         <a onclick="alert('Register or Login with an existing account to continue!')" target="_blank" class="image featured"><img src="images/t1.png" alt="" /></a>

         </article>
         <article class="col-4 col-12-mobile special zoom">
         <a onclick="alert('Register or Login with an existing account to continue!')"target="_blank" class="image featured"><img src="images/t2.png" alt="" /></a>

         </article>
         <article class="col-4 col-12-mobile special zoom">
         <a onclick="alert('Register or Login with an existing account to continue!')" target="_blank" class="image featured"><img src="images/t3.png" alt="" /></a>


         <%
         } else if (session.getAttribute("useremail") != null) {
         %>

         <div class="row">
         <article class="col-4 col-12-mobile special zoom">
         <a href='mainPage.jsp?u=<%out.println(SessionEmail);%>' target="_blank" class="image featured"><img src="images/t1.png" alt="" /></a>

         </article>
         <article class="col-4 col-12-mobile special zoom">
         <a href='mainPage2.jsp?u=<%out.println(SessionEmail);%>' target="_blank" class="image featured"><img src="images/t2.png" alt="" /></a>

         </article>
         <article class="col-4 col-12-mobile special zoom">
         <a href='mainPage3.jsp?u=<%out.println(SessionEmail);%>' target="_blank" class="image featured"><img src="images/t3.png" alt="" /></a>

         <%
         }
         %>

         </article>
         </div>
         </section>
         <hr style="width:50%;text-align; margin-top:-50px;">

         <section id="about" class="special">
         <header>

         <h2 style="color: white;">Why should I use CiVi?</h2>
         <br/>
         <hr style="width:50%;text-align; margin-top:-50px;">
         <p>CiVi is a free solution to the age old nuisance of creating a proper resume.
         <br>No more formatting or styling issues.</p>
         <p>Simply create an account, choose a template and fill in your info - it's that easy!
         <br/>Once you're done, you can download your finished resume in pdf or clear text format.</p>
         <p>Upon making your first resume, or revising an existing one, you can always
         <br>come back to it later without fear of losing your progress.
         <hr style="width:50%;text-align; margin-top:-50px; margin-bottom:75px">

         <br/>
         <br/>
         </header>
         </section>


      </div>

      <script src="assets/js/jquery.min.js"></script>
      <script src="assets/js/jquery.dropotron.min.js"></script>
      <script src="assets/js/jquery.scrolly.min.js"></script>
      <script src="assets/js/jquery.scrollex.min.js"></script>
      <script src="assets/js/browser.min.js"></script>
      <script src="assets/js/breakpoints.min.js"></script>
      <script src="assets/js/util.js"></script>
      <script src="assets/js/main.js"></script>

      <div style="text-align:center">

        <footer class="copyright" style="margin-top: 20px;">
           <ul class="menu">
           <p style="text-align:center"> &copy; CiVi. All rights reserved.<a style="font-weight: bold;"  href="login.jsp"> Admin Login</a></p>
           </ul>
        </footer>

    </div>
   </body>
</html>
