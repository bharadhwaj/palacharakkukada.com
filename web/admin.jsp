<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Palacharakkukada.com</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootswatchce.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
  </head>
<body>
  <jsp:include page="navbar.jsp" />
  <div class="container">
    <div class="row">
      <div class="col-md-10 col-md-offset-1">
        <div>
          <!-- Nav tabs -->
          <ul class="nav nav-tab nav-justified" role="tablist">
            <li role="presentation" class="active toggle">
              <a href="#all-users" aria-controls="login" role="tab" data-toggle="tab">
              <h3 style="color:#757575"><b>All Users</b></h3>
              </a>
            </li>
            <li role="presentation">
              <a href="#all-products" aria-controls="signup" role="tab" data-toggle="tab">
              <h3 style="color:#757575"><b>All Products</b></h3>
              </a>
            </li>
            <li role="presentation">
              <a href="#alter-products" aria-controls="signup" role="tab" data-toggle="tab">
              <h3 style="color:#757575"><b>Alter Products</b></h3>
              </a>
            </li>
            <li role="presentation">
              <a href="#add-products" aria-controls="signup" role="tab" data-toggle="tab">
              <h3 style="color:#757575"><b>Add Products</b></h3>
              </a>
            </li>
          </ul>

          <!-- Tab panes -->
          <div class="tab-content">
            <div role="tabpanel" class="tab-pane fade in active" id="all-users">
              <div class="panels panel-default">
                <div class="panels-body">
                    <table class="table table-striped table-hover ">
                      <thead>
                        <tr class="warning">
                          <th>#</th>
                          <th>Name</th>
                          <th>Email ID</th>
                          <th>Admin</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr class="default">
                          <td>1</td>
                          <td>Bharadhwaj</td>
                          <td>bharadhwaj@content.com</td>
                          <td><button class="btn btn-danger">Remove Admin</button></td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td>Column content</td>
                          <td>Column content</td>
                          <td><button class="btn btn-success">Make Admin</button></td>
                        </tr>
                        <tr class="default">
                          <td>3</td>
                          <td>Column content</td>
                          <td>Column content</td>
                          <td><button class="btn btn-success">Make Admin</button></td>
                        </tr>
                        <tr>
                          <td>4</td>
                          <td>Column content</td>
                          <td>Column content</td>
                          <td><button class="btn btn-success">Make Admin</button></td>
                        </tr>
                      </tbody>
                    </table>
                  
                </div>
              </div>
            </div>

            <div role="tabpanel" class="tab-pane fade" id="all-products">
              <div class="panels panel-default">
                <div class="panels-body">
                  <table class="table table-striped table-hover ">
                      <thead>
                        <tr class="warning">
                          <th>#</th>
                          <th>Name</th>
                          <th>Category</th>
                          <th>Price</th>
                          <th>Current Stock</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr class="default">
                          <td>1</td>
                          <td>Rice</td>
                          <td>Grains</td>
                          <td>40</td>
                          <td>1200</td>
                        </tr>
                        <tr>
                          <td>2</td>
                          <td>Whear</td>
                          <td>Grains</td>
                          <td>55</td>
                          <td>200</td>
                        </tr>
                      </tbody>
                    </table>
                </div>
              </div>
            </div>

            <div role="tabpanel" class="tab-pane fade" id="alter-products">
              <div class="panels panel-default">
                <div class="panels-body">

                  <table class="table table-striped table-hover ">
                      <thead>
                        <tr class="warning">
                          <th>#</th>
                          <th>Name</th>
                          <th>Category</th>
                          <th>Price</th>
                          <th>Current Stock</th>
                          <th>Remove product</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr class="default">
                          <td> 1 </td>
                          <td><input type="text" value="Rice"> </td>
                          <td>
                              <select class="dropdown">
                                <option>Category 1</option>
                                <option>Category 2</option>
                                <option>Category 3</option>
                              </select>
                          </td>
                          <td> <input type="number" class="form-control" id="price" value="40" style="width: 60px;" min="1" > </td>
                          <td> <input type="number" class="form-control" id="stock" value="200" style="width: 80px;" min="1" > </td>
                          <td><a href="#" class="btn btn-danger">Remove</a></td>
                        </tr>
                      </tbody>
                    </table>


                </div>
              </div>
            </div>

            <div role="tabpanel" class="tab-pane fade" id="add-products">
              <div class="panels panel-default">
                <div class="panels-body">

                  <form class="form-signin" role="login" action="login" method="post">
                    <input type="hidden" name="form" value="login">
                   
                    <div class="form-group">
                      <label for="sel1">Product Name:</label>
                      <input type="name" class="form-control" name="productname" placeholder="Product Name" required autofocus>
                    </div>
                    <br>
                    <div class="form-group">
                      <label for="sel1">Category:</label>
                      <select class="form-control" id="sel1">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                      </select>
                    </div>
                    <br>
                    <div class="form-group">
                      <label for="sel1">Price</label>
                      <input type="number" class="form-control" id="price" min="1" >
                    </div>
                    <br>
                    <div class="form-group">
                      <label for="sel1">Stock</label>
                      <input type="number" class="form-control" id="stock" min="1" >
                    </div>
                  
                    <br>
                    <button class="btn btn-lg btn-success btn-block">Add Product</button>
                    <button class="btn btn-lg btn-warning btn-block">Cancel</button>
                  </form>
                
                </div>
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