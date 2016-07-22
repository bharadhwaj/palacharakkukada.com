<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>Shipping details</title>
    
    <link href="static/css/bootswatchce.css" rel="stylesheet">
    <link href="static/css/signin.css" rel="stylesheet">
</head>
<body>
  <jsp:include page="navbar.jsp" />
  <%
            ArrayList<HashMap<String,String>> cartItems = (ArrayList<HashMap<String,String>>)request.getAttribute("cartItems");
  %>
  <div class="container" style="padding-top:30px;">
    <div class="row">
      <div class="col-md-6">
        <h2> Items in cart </h2>
        <table class="table table-striped table-hover">
          <thead>
            <tr class="warning">
              <th> Sl No</th>
              <th> Product</th>
              <th> Price</th>
              <th> Quantity</th>
              <th> Total</th>
            </tr>
          </thead>
          <tbody>
            <% for(HashMap<String,String> item: cartItems){ %>
                        <tr>
                          <td> 1 </td>
                          <td> <%=item.get("item")%> </td>
                          <td> <%=item.get("price")%> </td>
                          <td> <%=item.get("quantity")%> </td>
                          <td> <%=item.get("total")%> </td>
                        </tr>
             <% }%>
                     <tr class="success">
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td> <strong> Total </strong> </td>
                        <td>Rs. ${totalAmount}</td>
                      </tr>
          </tbody>
        </table>
      </div>
      <div class="col-md-5 col-md-offset-1">
        <div class="panels panel-default">
          <div class="panel-heading">
            <center><h3>  Shipping Details  </h3>
            <span class="text-muted"> The product will be send to the below address. </span></center> 
          </div>
          <div class="panels-body">
              <form class="form-horizontal" action="shipping" method="post">
              <div class="form-group">
                <label for="name" class="col-sm-2 control-label">Name*</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="name" id="name" placeholder="name">
                </div>
              </div>
              <div class="form-group">
                <label for="email" class="col-sm-2 control-label">Email*</label>
                <div class="col-sm-10">
                  <input type="email" class="form-control" name="email" id="email" placeholder="email address">
                </div>
              </div>
              <div class="form-group">
                <label for="address" class="col-sm-2 control-label">Address*</label>
                <div class="col-sm-10">
                    <textarea class="form-control" name="address" rows="3"></textarea>
                </div>
              </div>
              <div class="form-group">
                <label for="pin" class="col-sm-2 control-label">Pincode*</label>
                <div class="col-sm-10">
                  <input type="text" maxlength="6" class="form-control" name="pin" id="email" placeholder="pincode">
                </div>
              </div>
              <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">Phone</label>
                <div class="col-sm-10">
                  <div class="input-group">
                      <span class="input-group-addon">+91</span>
                      <input type="text" maxlength="10" class="form-control" name="phone" id="email" placeholder="+919645567834">
                    </div>
                </div>
              </div>
              
              <div class="form-group">
                <center>
                <button type="submit" class="btn btn-success">Purchase</button>
                <button type="submit" class="btn btn-warning">Back</button>
                </center>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="footer.jsp" />
  <script src="static/js/jquery.js"></script>
  <script src="static/js/bootstrap.min.js"></script>
</body>
</html>
