<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login | Sign up - Palacharakkukada.com</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootswatchsl.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
  </head>
<script>
  function checkPasswordMatch() {
    var password = $("#password").val();
    var confirmPassword = $("#password-confirm").val();

    if (password != confirmPassword)
        $("#divCheckPasswordMatch").html("Passwords do not match!");
    else
        $("#divCheckPasswordMatch").html("Passwords match.");
  }

  $(document).ready(function () {
     $("#password-confirm").keyup(checkPasswordMatch);
  });
  
</script>
<style type="text/css">
  .verticalLine {
    border-left: thick solid #fff000;
  }
  .navbar-nav > li{
  font-size: 14px;
}
</style>
  <body>
  <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-5">
      </div>
      <div class="col-lg-4">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <center>
          <a class="navbar-brand" href="#">palacharakkukada.com</a>
          </center>
        </div>

      </div><!-- /.navbar-collapse -->
      <div class="col-lg-3">
      </div>
    </div>
  </div><!-- /.container-fluid -->
</nav>




<div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div>
          

          <!-- Tab panes -->
          <div class="tab-content">
            <!-- Nav tabs -->
          <ul class="nav nav-tabs nav-justified" role="tablist">
            <li role="presentation" class="active">
              <a href="#login" aria-controls="login" role="tab" data-toggle="tab">Login</a>
            </li>
            <li role="presentation">
              <a href="#signup" aria-controls="signup" role="tab" data-toggle="tab">Signup</a>
            </li>
          </ul>
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


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="static/js/jquery.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
  </body>
</html>
