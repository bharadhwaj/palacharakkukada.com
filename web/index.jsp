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

    <title>Welcome to Palacharakkukada.com</title>

    <!-- Bootstrap core CSS -->

    <link href="static/css/font-awesome.css" rel="stylesheet">
    <link href="static/css/bootswatchce.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
  </head> 

<body>
    
    <jsp:include page="navbar.jsp" />
    <div class="container">
    <jsp:include page="flash.jsp" />
    </div>
  
  <!-- Carousel Starts here. -->     
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
      <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="https://placehold.it/1400x300" alt="...">
        <div class="carousel-caption">
          Our new product 1.
        </div>
      </div>
      <div class="item">
        <img src="https://placehold.it/1400x300" alt="...">
        <div class="carousel-caption">
          Our new product 2.
        </div>
      </div>
      <div class="item">
        <img src="https://placehold.it/1400x300" alt="...">
        <div class="carousel-caption">
          Our new product 3.
        </div>
      </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <!-- Carousel ends here. -->
  <%
      if(session.getAttribute("items") == null) {
          response.sendRedirect("home");
      }else {
        ArrayList<HashMap<String,String>> items = (ArrayList<HashMap<String,String>>)session.getAttribute("items");
  %>
    <div class="container" style="padding-top:20px;">
	<div class="row">
          <% for(HashMap<String,String> item: items){ %>
	  <div class="col-sm-6 col-md-4">
	    <div class="thumbnail">
	      <img class="imgOpacity img-responsive" src="static/images/<%=item.get("image")%>" alt="...">
	      <div class="caption">
	        <center>
	        <h3><a href="" style="text-decoration:none;"><%=item.get("item")%></a></h3>
	        <h4 style="color:#656565;"><%=item.get("brand")%></h4>
	        <p> One line description of the item if necessary </p>
	        <h4 style="color:#656565;">Rs.<%=item.get("price")%></h4>
	        <p><a href="#" class="btn btn-info" role="button">Buy Now</a> <a href="#" class="btn btn-warning" role="button">Add to Cart</a></p>
	        </center>
	      </div>
	    </div>
	  </div>
          <% }} %>
	</div>
    </div>
  <jsp:include page="footer.jsp" />
  
</body>




    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="static/js/jquery.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
  


  </html>
