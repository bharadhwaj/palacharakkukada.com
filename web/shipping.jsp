<%-- 
    Document   : shipping.jsp
    Created on : 22 Jul, 2016, 1:05:28 AM
    Author     : anil
--%>

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
        <div class="container" style="padding-top:30px;">
            <div class="row">
                <div class="col-md-6">
                    <h2> Items in cart </h2>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th> SI No</th>
                                <th> Product</th>
                                <th> Price</th>
                                <th> Quantity</th>
                                <th> Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td> 1 </td>
                                <td> Nokia 220 </td>
                                <td> 2699 </td>
                                <td> 1 </td>
                                <td> 2699 </td>
                            </tr>
                            <tr>
                                <td> 2 </td>
                                <td> Samsung Guru </td>
                                <td> 1500 </td>
                                <td> 1 </td>
                                <td> 1500 </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-5 col-md-offset-1">
                    <div class="panels panel-default">
                        <div class="panel-heading"><h3> <center> Shipping Details </center> </h3> </div>
                        <div class="panels-body">
                            <form class="form-horizontal">
                                <div class="form-group">
                                  <label for="name" class="col-sm-2 control-label">Name*</label>
                                  <div class="col-sm-10">
                                    <input type="text" class="form-control" id="name" placeholder="name">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label for="email" class="col-sm-2 control-label">Email*</label>
                                  <div class="col-sm-10">
                                    <input type="email" class="form-control" id="email" placeholder="email address">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label for="address" class="col-sm-2 control-label">Address*</label>
                                  <div class="col-sm-10">
                                    <textarea class="form-control" rows="3"></textarea>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label for="pin" class="col-sm-2 control-label">Pincode*</label>
                                  <div class="col-sm-10">
                                    <input type="number" class="form-control" id="email" placeholder="pincode">
                                  </div>
                                </div>
                                <div class="form-group">
                                  <label for="phone" class="col-sm-2 control-label">Phone</label>
                                  <div class="col-sm-10">
                                    <input type="number" class="form-control" id="email" placeholder="+919645567834">
                                  </div>
                                </div>
                                <span class="text-muted"> By clicking the below button, the product will be send to the above address. </span><br><br>
                                <div class="form-group">
                                  <div class="col-sm-offset-4 col-sm-4">
                                    <button type="submit" class="btn btn-info">Purchase</button>
                                  </div>
                                </div>
                              </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="static/js/jquery.js"></script>
        <script src="static/js/bootstrap.min.js"></script>
    </body>
</html>
