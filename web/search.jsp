<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Search results</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootswatchce.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
  </head> 
  <style type="text/css">
    .imgOpacity
    {
        border-width: 1px;
        border-color: #333;
        opacity: .5;

    }
    .imgOpacity:hover {
        opacity: 1;
        transition: all 1s;
        -webkit-transition: all 1s;

    }

  </style>

<body>
    
  <jsp:include page="navbar.jsp" />
    <div class="container">
        <form action="search" method="get">
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><strong>Search results for:</strong></span>
                <input class="form-control" type="text" name="search" value=${searchKey}>
                <span class="input-group-btn">
                  <button class="btn btn-info" type="button">Search!</button>
                </span>
              </div>
            </div>
        </form>
        <%
            if(request.getAttribute("searchResults") != null) {
                ArrayList<HashMap<String,String>> searchResults = (ArrayList<HashMap<String,String>>)request.getAttribute("searchResults");
        %>
            <div class="row">
                <div class="col-md-10">
                    <div class="container" style="padding-top:20px;">
                        <div class="row">
                          <% for(HashMap<String,String> product: searchResults){ %>
                          <div class="col-sm-6 col-md-4">
                            <div class="thumbnail">
                              <img class="imgOpacity img-responsive" src="static/images/<%=product.get("image")%>" alt="...">
                              <div class="caption">
                                <center>
                                <h3><a href="" style="text-decoration:none;"><%=product.get("name")%></a></h3>
                                <h4 style="color:#656565;"><%=product.get("company")%></h4>
                                <p> One line description of the product if necessary </p>
                                <h4 style="color:#656565;">Rs.<%=product.get("price")%></h4>
                                <p><a href="#" class="btn btn-info" role="button">Buy Now</a> <a href="#" class="btn btn-warning" role="button">Add to Cart</a></p>
                                </center>
                              </div>
                            </div>
                          </div>
                          <% } %>
                        </div>
                    </div>
                </div>
            </div>
	<%
            } else {
        %>
        <b> No match found </b>
        <% } %>
    </div>

    <jsp:include page="footer.jsp" />

</body>




    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="static/js/jquery.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
  


  </html>
