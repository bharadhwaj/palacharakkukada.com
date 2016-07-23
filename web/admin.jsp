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

    <title>Admin Palacharakkukada.com</title>

    <!-- Bootstrap core CSS -->
    <link href="static/css/bootswatchce.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
  </head>
<body>
    <%
    if(session.getAttribute("username") == null || Integer.parseInt(session.getAttribute("isAdmin")+"") == 0) {
        response.sendRedirect("login.jsp");
    }
    %>
  <jsp:include page="navbar.jsp" />
  <jsp:include page="flash.jsp" />
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
                      <%
                            if(request.getAttribute("users") != null) {
                                ArrayList<HashMap<String,String>> users = (ArrayList<HashMap<String,String>>)request.getAttribute("users");
                        %>
                        <tbody>
                            <% for(HashMap<String,String> user: users){ %>
                                <tr class="default">
                                    <form action="makeAdmin" method="post">
                                        <input type="hidden" value="<%=user.get("userID")%>" name="userID">
                                        <td>1</td>
                                        <td><%=user.get("name")%></td>
                                        <td><%=user.get("emailID")%></td>
                                        <% if(user.get("userID").equals(""+session.getAttribute("userID"))) {%>
                                            <td></td>
                                        <% } else if(user.get("isAdmin").equals("0")) { %>
                                            <td><button class="btn btn-success" name="admin" value="makeAdmin">Make Admin</button></td>
                                        <% } else {%>    
                                            <td><button class="btn btn-danger" name="admin" value="removeAdmin">Remove Admin</button></td>
                                        <% } %>
                                    </form>
                                </tr>
                            <% } %>
                        </tbody>
                        <% } %>
                    </table>
                  
                </div>
              </div>
            </div>

            <div role="tabpanel" class="tab-pane fade" id="all-products">
                <%
                    if(request.getAttribute("items") != null) {
                        ArrayList<HashMap<String,String>> items = (ArrayList<HashMap<String,String>>)request.getAttribute("items");
                %>
                    <div class="panels panel-default">
                      <div class="panels-body">
                        <table class="table table-striped table-hover ">
                            <thead>
                              <tr class="warning">
                                <th>#</th>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Brand</th>
                                <th>Price</th>
                                <th>Current Stock</th>
                              </tr>
                            </thead>
                            <tbody>
                                <% for(HashMap<String,String> item: items){ %>
                              <tr class="default">
                                <td>1</td>
                                <td><%=item.get("item")%></td>
                                <td><%=item.get("category")%></td>
                                <td><%=item.get("brand")%></td>
                                <td><%=item.get("price")%></td>
                                <td><%=item.get("stock")%></td>
                              </tr>
                              <% } %>
                            </tbody>
                          </table>
                      </div>
                    </div>
                <% } else { %>
                    No items available
                <% } %>
            </div>

            <div role="tabpanel" class="tab-pane fade" id="alter-products">
                <%
                    if(request.getAttribute("items") != null) {
                        ArrayList<HashMap<String,String>> items = (ArrayList<HashMap<String,String>>)request.getAttribute("items");
                %>
                    <div class="panels panel-default">
                      <div class="panels-body">

                        <table class="table table-striped table-hover ">
                            <thead>
                              <tr class="warning">
                                <th>#</th>
                                <th>Name</th>
                                <th>Brand name</th>
                                <th>Price</th>
                                <th>Current Stock</th>
                                <th>Update</th>
                                <th>Remove product</th>
                              </tr>
                            </thead>
                            <tbody>
                                <% for(HashMap<String,String> item: items){ %>
                                <form action="AlterProducts" method="post">
                                    <input type="hidden" value="<%=item.get("itemID")%>" name="itemID">
                                    <tr class="default">
                                      <td> 1 </td>
                                      <td><input name="item" type="text" value="<%=item.get("item")%>"> </td>
                                      <td><input name="brand" type="text" value="<%=item.get("brand")%>"> </td>
                                      <td>
                                          <input name="price" type="number" class="form-control" id="price" value="<%=item.get("price").split("/")[0]%>" style="width: 60px;" min="1" >
                                          <input type="hidden" name="unit" value="<%=item.get("price").split("/")[1]%>">
                                      </td>
                                      <td> <input name="stock" type="number" class="form-control" id="stock" value="<%=item.get("stock")%>" style="width: 80px;" min="1" > </td>
                                      <td><input type="submit" name="alter" value="Update" class="btn btn-success"></td>
                                      <td><input type="submit" name="alter" value="Remove" class="btn btn-danger"></td>
                                    </tr>
                                  </form>
                                <% } %>
                            </tbody>
                          </table>


                      </div>
                    </div>
                <% } %>
            </div>

            <div role="tabpanel" class="tab-pane fade" id="add-products">
              <div class="panels panel-default">
                <div class="panels-body">

                  <form class="form-signin" role="login" action="AddProduct" method="post">
                    <input type="hidden" name="form" value="login">
                   
                    <div class="form-group">
                      <label for="sel1">Product Name:</label>
                      <input type="name" class="form-control" name="item" placeholder="Product Name" required autofocus>
                    </div>
                    <br>
                    <div class="form-group">
                      <label for="sel1">Category:</label>
                      <select class="form-control" id="sel1" name="type">
                        <option> Select category </option>
                        <option value="Grains">Grains</option>
                        <option value="Beverages">Beverages</option>
                        <option value="Grocery">Grocery</option>
                        <option value="Stationary">Stationary</option>
                        <option value="Others">Others</option>
                      </select>
                    </div>
                    <br>
                    <div class="form-group">
                      <label>Brand Name:</label>
                      <input type="name" class="form-control" name="brand" placeholder="Brand Name" required autofocus>
                    </div>
                    <br>
                    <div class="form-group">
                      <label for="sel1">Price</label>
                      <input type="text" name="price" class="form-control" id="price" placeholder="35/kg">
                    </div>
                    <br>
                    <div class="form-group">
                      <label for="sel1">Stock</label>
                      <input type="number" class="form-control" name="stock" min="1" >
                    </div>  
                    <br>
                    <div class="form-group">
                      <label>Image</label>
                      <input type="file" class="form-control" name="image">
                    </div>  
                    <br>
                    <input type="submit" class="btn btn-lg btn-success btn-block" value="Add Product">
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