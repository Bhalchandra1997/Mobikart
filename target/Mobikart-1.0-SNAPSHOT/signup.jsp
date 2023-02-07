

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
        
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
      
        <div class="container-fluid">
            
             
        <div class="row mt-1">
            <div class="col-md-4 offset-md-4">
             
                <div class="card">
                    
                    <%@include file="components/message.jsp" %>
                    <div class="card-body">
                        
                           
                <h3 class="text-center">SignUp</h3>
                <form action="Signup" method="post">
                    
                     <div class="form-group">
                          <label for="name">Name</label>
                          <input name="username" type="text" class="form-control" id="name" placeholder="Enter here" aria-describedby="emailHelp">    
                     </div>
                    
                     <div class="form-group">
                          <label for="email">Email</label>
                          <input name="useremail" type="email" class="form-control" id="email" placeholder="Enter here" aria-describedby="emailHelp">    
                     </div>
                    
                     <div class="form-group">
                          <label for="password">Password</label>
                          <input name="userpassword" type="password" class="form-control" id="password" placeholder="Enter here" aria-describedby="emailHelp">    
                     </div>
                    
                     <div class="form-group">
                          <label for="phone">Phone</label>
                          <input name="userphone" type="number" class="form-control" id="phone" placeholder="Enter here" aria-describedby="emailHelp">    
                     </div>
                    
                     <div class="form-group">
                          <label for="address">Address</label>
                          <textarea name="useraddress" style="height:100px " class="form-control" placeholder="Enter here"></textarea>
                     </div>
                    
                    <div class="container text-center">
                        <button class="btn btn-outline-success">SignUp</button>
                        <button class="btn btn-outline-warning">Reset</button>
                        
                        
                    </div>
                    
                    </form>         
                    </div>     
                </div>
            </div>   
        </div>
        </div>
    </body>
</html>
