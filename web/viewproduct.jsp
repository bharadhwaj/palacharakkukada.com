<%@page import="java.util.HashMap"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>View Product</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootswatchce.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
  </head> 

<body>
    
    <jsp:include page="navbar.jsp" />
    <div class="container">
<%
    if(request.getAttribute("product") != null) {
    	 HashMap<String,String> product = (HashMap<String,String>)request.getAttribute("product");
%>
    	<ul class="breadcrumb">
			  <li><a href="#">Home</a></li>
			  <li><a href="#"><%= product.get("type") %></a></li>
			  <li class="active"><%= product.get("item") %></li>
		</ul>


    	<div class="row">
    		<div class="col-md-10">
				  <div class="col-md-4">
				      <a href="#" class="thumbnail"  data-toggle="modal" data-target="#popUp">
					      <img src="<%= product.get("image") %>" alt="...">
					    </a>
				  </div>
				  <div class="col-sm-8">
				        <h1 style="color:black;"><strong><%= product.get("item") %></strong></h1>
				        <h4><%= product.get("brand") %></h4>
				        <hr style="height:1px;border:none;color:#333;background-color:#333;" />
				        <div class="well well-sm">
								 	<strong> Specs: </strong>
								 	<div class="row">
										<div class="col-md-6">
										  <ul>
										  	<li>Feature1</li>
										  	<li>Feature2</li>
										  </ul>
										</div>
										<div class="col-md-6">
										  <ul>
										  	<li>Feature1</li>
										  	<li>Feature2</li>
										  </ul>
										</div>
									</div>
								</div>
								<hr style="height:1px;border:none;color:#333;background-color:#333;" />
								<p>Original Price: <strike>Rs. 999</strike></p>
				        <h2 style="color:#656565;"><strong>Rs.</strong><%= product.get("price") %></h2>
                                        <form action="addToCart" method="post">
                                            <input type="hidden" value="<%=product.get("itemID")%>" name="itemID">
                                            <input type="hidden" name="quantity" value=1>
                                            <p><input type="submit" class="btn btn-info" value="Buy Now" name="submit"> <input type="submit" class="btn btn-warning" value="Add to Cart" name="submit"></p>
                                        </form>
				  </div>
				</div>
			</div>
			<% } %>

			<!-- Pop ups -->
			<div class="modal fade" id="popUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel"><center>Product Name</center></h4>
			      </div>
			      <div class="modal-body">
				      <center>
				        <img  src="static/images/logo_full.png" style="width: 100%; height: 100%" alt="...">
				      </center>
			      </div>
			    </div>
			  </div>
			</div>
			<hr style="height:2px;border:none;color:#333;background-color:#333;" />
			<h2> Small Write Up </h2>
			<p> Blah Blah Blah </p>
			<hr style="height:2px;border:none;color:#333;background-color:#333;" />

			<div class="row">
			<h2> Specifications </h2>
				<table class="table table-striped table-hover ">
				  <thead>
				    <tr class="warning">
				      <th>#</th>
				      <th>Spec Name</th>
				      <th>Specs</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr class="default">
				      <td>1</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr>
				      <td>2</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="default">
				      <td>3</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr>
				      <td>4</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				  </tbody>
				</table>
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
