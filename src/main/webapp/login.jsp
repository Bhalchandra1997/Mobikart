

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>

        <style>

            .navbar{


                background: #2874f0!important;
            }

        </style>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">

            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <div class = "card mt-3">
                        <div class="card-header navbar text-white">
                            <h3 >Login</h3>
                        </div>  

                        <div class="card-body">
                            <%@include file="components/message.jsp" %>

                            <form action="login" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <a href="signup.jsp">if not Signup click here</a>

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <button type="reset" class="btn btn-primary">Reset</button>

                                </div>
                            </form>
                        </div>


                    </div>

                </div>


            </div>



        </div>

    </body>
</html>
