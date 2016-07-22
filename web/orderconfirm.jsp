<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Order Confirmation</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootswatchce.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
  </head> 

<body>
    
  <jsp:include page="navbar.jsp" />
  <div class="container">
  	<div class="row">
  		<div class="col-md-10 col-md-offset-1">
				<div class="jumbotron">
			  	<center>
			  		<h1>Thanks for your order!</h1>
			  		<h3 style="color:#757575">Please give your feedback on the purchase: </h3>
						<p>
							<button class="btn btn-success">Happy</button>
							<button class="btn btn-warning">Neutral</button>
							<button class="btn btn-danger">Miserable</button>
						</p>
					
		  		<h3> Your order ID is: <a href="">PK0010</a></h3>
		  		<h3 style="color:#757575">List of items you bought: </h3>
  				<div class="row">
	  				<div class="list-group col-md-6 col-md-offset-3">
						  <a class="list-group-item">Nokia 2210 x 1</a>
						  <a class="list-group-item">Moto G x 1</a>
						</div>			
					</div>
					<h4 style="color:#757575">Order will be delivered within 6-7 business days!</h3>
					</center>
					
    			<div><a class="btn btn-success btn-lg" href="#" role="button">Continue Shopping</a></div>
				</div>
			</div>
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
