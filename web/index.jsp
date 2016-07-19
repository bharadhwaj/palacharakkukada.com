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
    <link href="static/css/bootswatchsl.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
  </head> 

<body>
  <jsp:include page="navbar.jsp" />
  <!-- main right col -->

        
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
            <img src="..." alt="...">
            <div class="carousel-caption">
              ...
            </div>
          </div>
          <div class="item">
            <img src="..." alt="...">
            <div class="carousel-caption">
              ...
            </div>
          </div>
          ...
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


  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
    
        <div>
          <!-- Nav tabs -->
          <ul class="nav nav-tabs" role="tablist" >
            <li role="presentation" class="active">
              <a href="#login" aria-controls="login" role="tab" data-toggle="tab">Login</a>
            </li>
            <li role="presentation">
              <a href="#signup" aria-controls="signup" role="tab" data-toggle="tab">Signup</a>
            </li>
          </ul>

          <!-- Tab panes -->
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade in active" id="login">
              <div class="panel panel-default">
                <div class="panel-body">
                  <center>
                    <h1 style="color:#2A515E"><b>Login</b></h1>
                  </center>
                  <hr>
                  <form class="form-signin" role="login" action="login" method="post">
                    <input type="email" class="form-control" name="email" placeholder="Email address" required autofocus>
                    <br>
                    <input type="password" class="form-control" name="password" placeholder="Password"  required>
                    <br>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                  </form>
                  <div class = "row form-signin" style="padding-top:1em; padding-bottom:1em; font-size: 16px">
                    Don't have an account? Register first!
                  </div>
                </div>
              </div>
            </div>
            <div role="tabpanel" class="tab-pane fade" id="signup">
              <div class="panel panel-default">
                <div class="panel-body">
                  <center>
                    <h1 style="color:#2A5E2A"><b>Sign up</b></h1>
                  </center>
                  <hr>
                  <form class="form-signin" role="login" action="login" method="post">
                    <input type="text" class="form-control" name="name" placeholder="Name" required autofocus>
                    <br>
                    <input type="email" class="form-control" name="email" placeholder="Email address" required autofocus>
                    <br>
                    <input type="password" class="form-control" name="password" placeholder="Password"  required>
                    <br>
                    <input type="password" class="form-control" name="confirm-password" placeholder="Confirm Password"  required>
                    <br>
                    <button class="btn btn-lg btn-success btn-block" type="submit">Sign up</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div> 
      </div> <!-- col-md-8 col-md-offset-2-->
    </div> <!-- row -->
  </div><!-- container -->
</body>




    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="static/js/jquery.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
  


  </html>
