<%@page import="java.util.Map"%>
<%@page import="com.test.test.helper.helper"%>
<%@page import="java.util.List"%>
<%@page import="com.test.entities.Category"%>
<%@page import="com.test.dao.CategoryDao"%>
<%@page import="com.test.test.helper.FactoryProvider"%>
<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {

        session.setAttribute("message", "You are not logged in !!! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {

        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not admin !");
            response.sendRedirect("login.jsp");

            return;
        }

    }


%>

<%     CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();
    
    //getting count
    
     Map <String, Long> m =helper.getCounts(FactoryProvider.getFactory());

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>

        <style>

            .card:hover{

                background:#e2e2e2;
                cursor: pointer;
            }
            .card{

                border: 1px solid black;


            }


        </style>

    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="container-fluid">

                <%@include file="components/message.jsp" %> 

            </div>
            <div class="row mt-3">

                <!-- first col-->
                <div class="col-md-4 ">

                    <div class="card" >

                        <div class="card-body text-center ">

                            <div class="container">

                                <img style ="max-width:100px" class ="img-fluid" src="img/users.png" alt="user_icon">
                            </div> 

                            <h1><%= m.get("userCount") %></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>


                        </div>


                    </div>


                </div>

                <!-- second col -->
                <div class="col-md-4">

                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">

                                <img style ="max-width:100px" class ="img-fluid" src="img/categories.png" alt="user_icon">
                            </div> 

                            <h1><%= list.size()%></h1>

                            <h1 class="text-uppercase text-muted">Categories</h1>


                        </div>


                    </div>


                </div>

                <!-- third col -->
                <div class="col-md-4">

                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">

                                <img style ="max-width:100px" class ="img-fluid" src="img/products.png" alt="user_icon">
                            </div> 

                            <h1><%= m.get("productCount") %></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>


                        </div>


                    </div>


                </div>
            </div>

            <!-- Second Row -->

            <div class="row mt-3">

                <!<!-- second row first col -->
                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-category-modal" >

                        <div class="card-body text-center">

                            <div class="container">

                                <img style ="max-width:100px" class ="img-fluid" src="img/addcategory.png" alt="user_icon">
                            </div> 

                            <p class="mt-2">Click here to add new Category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>


                        </div>


                    </div>

                </div>

                <!<!-- Second row second col -->
                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-product-modal">

                        <div class="card-body text-center">

                            <div class="container">

                                <img style ="max-width:100px" class ="img-fluid" src="img/addproducts.png" alt="user_icon">
                            </div> 

                            <p class="mt-2">Click here to add Product</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>


                        </div>


                    </div>

                </div>

            </div>



        </div>

        <!-- Add category model -->



        <!-- Modal -->

        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header navbar text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory">


                            <div class="form-group">
                                <input type ="text" class="form-control" name="catTitle" placeholder="Enter category title" required />

                            </div>

                            <div class="form-group">

                                <textarea style="height:250px " class="form-control"  name="catDescription" placeholder="Enter Category description" required ></textarea> 

                            </div>

                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
        <!-- End category model -->

        <!-- Product modal-->


        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <!-- form -->
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct"/>
                            <!-- Product Name -->  

                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter Product Name" name="pName" required>  

                            </div>  

                            <!-- Product Description -->

                            <div class="form-group">

                                <textarea style="height: 125px" class="form-control" placeholder="Enter Product Description" name="pDesc"></textarea>

                            </div>  

                            <!-- product price -->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Product Price" name="pPrice" required>  

                            </div> 

                            <!-- product discount-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Product Discount" name="pDiscount" required>  

                            </div>

                            <!-- product quantity-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Product Quantity" name="pQuantity" required>  

                            </div>

                            <!-- product category-->



                            <div class="form-group">
                                <select name ="catId" class="form-control">

                                    <%
                                        for (Category c : list) {


                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>                                


                                    <% }%>

                                </select> 

                            </div>

                            <!-- Product file -->

                            <div class="form-group">

                                <input type="file" id="pPic" name="pPic" required/>  

                            </div>

                            <!-- Submit button -->

                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add Product</button>   



                            </div>




                        </form>

                        <!-- End form -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>


        <!-- End Product modal-->

        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
