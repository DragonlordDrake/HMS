

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMS</title>
        <link href="css/style.css" rel="stylesheet" media="all" />
        <!--        <link href="css/login-box.css" rel="stylesheet" type="text/css"/>-->

        <link href="css/registration-style.css" rel="stylesheet" type="text/css"/>


        <script>
            function validateform()
            {
//                alert("here getting called");


                var name = document.myForm.username.value;
                var pass = document.myForm.password.value;
                var dept = document.myForm.dept.value;
                var phone = document.myForm.phone.value;
                var email = document.myForm.uemail.value;

                 if (name == "" || name == null)
                {
                    alert("pleas enter the name");
                    return false;
                }

                if (pass == "" || pass == null)
                {
                    alert("pleas enter the password");
                    return false;
                }

                if (dept == "" || dept == null)
                {
                    alert("pleas enter the Department");
                    return false;
                }

                if (phone == "" || phone == null)
                {
                    alert("pleas enter the Phone-Number");
                    return false;
                }
                else if (phone.length < 10 || phone.length > 10)
                {
                    alert("Enter 10digits number");
                    return false;
                }

                if (email == "" || email == null)
                {
                    alert("pleas enter the email");
                    return false;
                }
            }
        </script>

    </head>

    <body>
        <%
    session.invalidate();
    %>
        <script>
            function validate() {
                alert("here getting called");

                var name = document.myForm.username.value;


                alert(name);
            }
        </script>
        <div class="header-bg">
            <div class="wrap">
                <div class="logo">
                    <a href="index.jsp"><img src="images/logo.png" alt=""> </a>
                </div>

                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
        <div class="nav1-bg">
            <div class="wrap">
                <div class="nav"> 
                    <ul>
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="adminlogin.jsp">Admin </a></li>
                        <li><a href="doctorlogin.jsp">Doctor </a></li>
                        <li><a href="registration.jsp">Registration</a></li>
                         <li><a href="Plogin.jsp">Patient </a></li>
                        <li><a href="PReg.jsp">Registration</a></li>
                    </ul>      
                </div>
                <div class="clear"></div>
            </div>
        </div>


        <div style="width: 900px; background-image:url(../images/pattern_bg1.gif);  margin: -20px auto 0px;">

            <div class="login" >
                <div class="login-screen">
                    <div class="app-title">
                        <h1 style="color: #2980B9">REGISTRATION</h1>
                    </div>
                    <!---->
                    <form action="registration" method="post" name="myForm" onsubmit="return validateform()">
                        <div class="login-form">
                            <div class="control-group">
                                <input type="text" class="login-field" name="username" placeholder="username" id="username" >
                                <label class="login-field-icon fui-user" for="login-name"></label>
                            </div>
                            <div class="control-group">
                                <input type="password" class="login-field" name="password" placeholder="password" id="password" >
                                <label class="login-field-icon fui-lock" for="login-pass"></label>
                            </div>
                            <div class="control-group">
                                <input type="text" class="login-field" name="dept" placeholder="department" id="dept" >
                                <label class="login-field-icon fui-lock" for="login-pass"></label>
                            </div>

                            <div class="control-group">
                                <input type="number" class="login-field" name="phone" placeholder="phone" id="phone" >
                                <label class="login-field-icon fui-lock" for="login-pass"></label>
                            </div>
                            <div class="control-group">
                                <input type="email" class="login-field" name="uemail" placeholder="e-mail" id="uemail" >
                                <label class="login-field-icon fui-lock" for="login-pass"></label>
                            </div>

                            <input type="submit" value="Register" class="btn btn-primary btn-large btn-block"><br>
                            <input type="reset" value="Clear" class="btn btn-primary btn-large btn-block">
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
