<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Edit user details</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootswatchce.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
  </head>

<style type="text/css">
  .verticalLine {
    border-left: thick solid #fff000;
  }
  .navbar-nav > li{
  font-size: 14px;
}
</style>
  <body>
<%
    if(session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<jsp:include page="navbar.jsp" />
<jsp:include page="flash.jsp" />

<div class="container" style="padding-top:30px;">
      
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
          <!-- Nav tabs -->
          <ul class="nav nav-tab nav-justified" role="tablist">
            <li role="presentation" class="active toggle">
              <a href="#userdetails" aria-controls="userdetails" role="tab" data-toggle="tab">
              <h3 style="color:#2A515E"><b>Change user details</b></h3>
              </a>
            </li>
            <li role="presentation">
              <a href="#changepassword" aria-controls="changepassword" role="tab" data-toggle="tab">
              <h3 style="color:#2A5E2A"><b>Change Password</b></h3>
              </a>
            </li>
          </ul>

                    <!-- Tab panes -->
          <div class="tab-content">

            <div role="tabpanel" class="tab-pane fade in active" id="userdetails">
              <div class="panels panel-default">
                <div class="panels-body">
                  <form class="form-signin" role="login" action="editUserDetails" method="post">
                      
                      <input type="hidden" name="form" value="edituserdetails">
                      
                      <input type="text" class="form-control" name="name" placeholder="Name" required autofocus value="<%=session.getAttribute("username")%>">
                      <br>

                      <input type="email" class="form-control" name="email" id="email" value="<%=session.getAttribute("emailID")%>" placeholder="Email address" disabled autofocus>
                      <br>

                      <input type="password" class="form-control" name="password" placeholder="Enter Password to confirm" required>
                      <br>

                      <button class="btn btn-lg btn-info btn-block">Change details</button>

                  </form>
                </div>
              </div>
            </div>

            <div role="tabpanel" class="tab-pane fade" id="changepassword">
              <div class="panels panel-default">
                <div class="panels-body">
                  <form class="form-signin" role="login" action="editUserDetails" method="post">
                    
                    <input type="hidden" name="form" value="changepassword">
                    
                    <input type="password" class="form-control" name="password" id="password" placeholder="New Password" onInput="checkPasswordMatch();" required>

                    <input type="password" class="form-control" name="confirm-password" id="confirm-password" placeholder="Confirm New Password" onInput="checkPasswordMatch();" required>

                    <input type="password" class="form-control" name="old-password" placeholder="Old Password" required>

                    <span id="divCheckPasswordMatchError" class="text-danger"></span>
                    <span id="divCheckPasswordMatchSuccess" class="text-success"></span>
                    
                    <button class="btn btn-lg btn-success btn-block disabled" type="submit" id="submitButton">Change Password</button>
                    
                  </form>
                </div>
              </div>
            </div>

          </div>

      </div> <!-- col-md-8 col-md-offset-2-->
    </div> <!-- row -->
  </div><!-- container -->
  <jsp:include page="footer.jsp" />

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="static/js/jquery.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script>
      function checkPasswordMatch() {
        var password = $("#password").val();
        var confirmPassword = $("#confirm-password").val();

        if (password != confirmPassword) {
          $("#divCheckPasswordMatchError").html("Passwords do not match!");
          $("#divCheckPasswordMatchSuccess").html("");
          $('#submitButton').addClass("disabled");
        }
        else {
          $("#divCheckPasswordMatchError").html("");
          $("#divCheckPasswordMatchSuccess").html("Passwords match.");
          $('#submitButton').removeClass("disabled");
        }
      }
      

    </script>
  </body>
</html>
