

<%@page import="com.test.test.helper.helper"%>
<%@page import="com.test.entities.Category"%>
<%@page import="com.test.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.test.entities.Product"%>
<%@page import="com.test.dao.ProductDao"%>
<%@page import="com.test.test.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mobikart - Home </title>

        <style>
            .discount-label{

                font-size: 10px!important;
                font-style: italic;

            }

            .product-bg:hover{

                background:#e2e2e2;
                cursor: pointer;

            }


        </style>

        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>

        <%@include file="components/navbar.jsp" %>



        <div class="row mt-3 mx-2">

            <%  String cat = request.getParameter("category");
                // out.println(cat);

                ProductDao dao = new ProductDao(FactoryProvider.getFactory());

                List<Product> list = null;
                if (cat == null || cat.trim().equals("all")) {

                    list = dao.getAllProducts();
                } else {

                    int cid = Integer.parseInt(cat.trim());
                    list = dao.getAllProductsById(cid);
                }

                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();


            %>

            <!--show categories-->
            <div class="col-md-2">

                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Products 
                    </a>

                    <%
                       for (Category c : clist) {
                    %>


                    <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>

                    <%
                        }
                    %>

                </div>
            </div>

            <!-- show products-->
            <div class="col-md-10">

                <!--row-->
                <div class="row mt-4">

                    <!--product column-->
                    <div class="col-md-12">

                        <div class="card-columns">

                            <!--getting products-->
                            <%
                                for (Product p : list) {

                            %>

                            <!--Product card-->
                            <div class="card product-bg">

                                <div class="container text-center">

                                    <img class="card-img-top mt-2" src="img/products/<%= p.getpPhoto()%>" style="max-height: 200px; max-width: 100%; width: auto;" alt="Card image cap">
                                </div>


                                <div class="card-body">

                                    <h5 class="card-title"><%=p.getProductName()%></h5> 

                                    <p class="card-text">

                                        <%= helper.get10Words(p.getProductDescription())%>

                                    </p>



                                </div>  

                                <div class="card-footer">



                                    <button class="btn navbar text-white" onclick="add_to_cart(<%= p.getProductId()%>, '<%= p.getProductName()%>', <%= p.getPriceAfterDiscount()%>)"> Add to Cart </button>
                                    <button class="btn btn-outline-success"> &#8377 <%= p.getPriceAfterDiscount()%>/- <span class="text-secondary discount-label"> &#8377 <%= p.getProductPrice()%> <%= p.getProductDiscount()%>% off</span></button>


                                </div>


                            </div>




                            <%
                                }
                                if (list.size() == 0) {
                                    out.println("<h3>No items in this category</h3>");
                                }
                            %> 

                        </div>


                    </div>

                </div>
            </div>

        </div>

        <%@include file="components/common_modals.jsp" %>                   

    </body>
</html>
