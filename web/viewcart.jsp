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
        if(request.getAttribute("cartItems") == null) {
  %>
            No items in cart
  <%
        } else {
            ArrayList<HashMap<String,String>> cartItems = (ArrayList<HashMap<String,String>>)request.getAttribute("cartItems");
  %>
            <div class="container" style="padding-top:30px;">
              <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <h2> Items in cart </h2>
                  <table class="table table-striped table-hover">
                    <thead>
                      <tr class="warning">
                        <th> Sl No</th>
                        <th> Product</th>
                        <th> Price</th>
                        <th> Quantity</th>
                        <th> Total</th>
                        <th></th>
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
                          <td><a href="#" class="btn btn-danger">Remove</a></td>
                        </tr>
                       <% }%>
                      <tr class="success">
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td> Total </td>
                        <td>Rs. ${totalAmount}</td>
                        <td></td>
                      </tr>
                    </tbody>
                  </table>
                  <p> 
                    <center>
                      <button type="submit" class="btn btn-success">Proceed to check out</button>
                      <button type="submit" class="btn btn-warning">Buy more</button>
                    </center>
                  </p>
                </div>
              </div>
            </div>
     <% } %>
  <jsp:include page="footer.jsp" />
  <script src="static/js/jquery.js"></script>
  <script src="static/js/bootstrap.min.js"></script>
</body>
</html>
