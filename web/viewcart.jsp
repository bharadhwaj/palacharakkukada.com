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
  <jsp:include page="flash.jsp" />

            <div class="container" style="padding-top:30px;">
              <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <h2> Items in cart </h2>
      <%
            if(request.getAttribute("cartItems") == null) {
      %>
                <h3>Sorry! No items in cart yet. </h3>
      <%
            } else {
                ArrayList<HashMap<String,String>> cartItems = (ArrayList<HashMap<String,String>>)request.getAttribute("cartItems");
      %>
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
                      <%  int serialNumber = 1; 
                          for(HashMap<String,String> item: cartItems){
                          %>
                        <tr>
                    <form action="deleteItem" method="post">
                        <input type="hidden" value="<%=item.get("ID")%>" name="ID">
                          <td> <%=serialNumber%> </td>
                          <td> <%=item.get("item")%> </td>
                          <td> <%=item.get("price")%> </td>
                          <td> <%=item.get("quantity")%> </td>
                          <td> <%=item.get("total")%> </td>
                          <td><input type='submit' class="btn btn-danger" value='Remove'></td>
                    </form>
                        </tr>
                       <% serialNumber ++;}%>
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
                        <a href="cart?step=1" class="btn btn-success">Proceed to check out</a>
                        <% } %>
                      <a href="index.jsp" role="button" class="btn btn-warning">Buy more</a>
                    </center>
                  </p>
                </div>
              </div>
            </div>
     
  <jsp:include page="footer.jsp" />
  <script src="static/js/jquery.js"></script>
  <script src="static/js/bootstrap.min.js"></script>
</body>
</html>
