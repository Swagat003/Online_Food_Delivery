<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/Login.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.2.0/fonts/remixicon.css" rel="stylesheet" />
<title>Login page</title>
</head>
<body>
	<div id="Welcome_page">
        <div id="bg">
            <nav>
                <div id="logo">
                    <img src="images/LOGO.png" alt="Error" width="100" height="50">
                    <a href="index.jsp">Hunger</a>
                </div>
            </nav>
            <form action="LoginServlet" method="post">
            	<section id="form_body">
                <div id="Login_form">
                    <a id="cross" href="index.jsp"><i class="ri-close-large-line"></i></a>
                    <div id="L">
                        <h1>Login</h1>
                    </div>
                    <div id="user">
                        <input type="text" placeholder="Username" id="username" name="username" required>
                        <i class="ri-user-line"></i>
                    </div>
                    <br>
                    <div id="pass">
                        <input type="password" placeholder="Password" id="password" name="password" required>
                        <i class="ri-eye-line" id="eye"></i>
                    </div>
                    <br>
                    <div>
                        <button type="submit" id="submit">LOGIN</button>
                    </div>
                    
                    <%
	String error = request.getParameter("error");
	if (error != null && error.equals("1")) {
	%>
	<div id="msg_box" style="color: red;">Invalid username or password</div>
	<%
	}
	%>
	
	<%
	String rs = request.getParameter("registration");
	if (rs != null && rs.equals("success")) {
	%>
	<div id="msg_box" style="color: green;">Your registration is successful. Please login.</div>
	<%
	}
	%>
                 
                    <div id="text">
                        <h3>New to Hunger? <a href="signup.jsp">Sign up</a></h3>
                    </div>
                </div>
            	</section>
			</form>
        </div>
    </div>
    
    <script>
        const pass=document.getElementById("password");
        const eye=document.getElementById("eye")
        console.log(pass.type);
        eye.addEventListener("click",()=>{
          if(pass.type === "password"){
              eye.classList.remove("ri-eye-line");
              eye.classList.add("ri-eye-off-line");
              pass.type="text";
          }
          else{
              eye.classList.remove("ri-eye-off-line");
              eye.classList.add("ri-eye-line");
              pass.type="password"
          }
  
        })
  
      </script>
</body>
</html>