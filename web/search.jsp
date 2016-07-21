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

<body>
    
  <jsp:include page="navbar.jsp" />
  <div class="container">
  	
		<div class="form-group">
		  <div class="input-group">
		    <span class="input-group-addon"><strong>Search results for:</strong></span>
		    <input class="form-control" type="text" value="Here is what I searched">
		   	<span class="input-group-btn">
		      <button class="btn btn-info" type="button">Search!</button>
		    </span>
		  </div>
		</div>

		<div class="row">
			<div class="col-md-10">
			  <jsp:include page="listproduct.jsp" />
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
