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
            <tr>
              <td> 1 </td>
              <td> Nokia 220 </td>
              <td> 2699 </td>
              <td> <input type="number" class="form-control" id="email" value="1" style="width: 60px;" min="1" max="10"> </td>
              <td> 2699 </td>
              <td><a href="#" class="btn btn-danger">Remove</a></td>
            </tr>
            <tr class="default">
              <td> 2 </td>
              <td> Samsung Guru </td>
              <td> 1500 </td>
              <td> <input type="number" class="form-control" id="email" value="1" style="width: 60px;" min="1" max="10"> </td>
              <td> 1500 </td>
              <td><a href="#" class="btn btn-danger">Remove</a></td>
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
                  <input type="text" maxlength="6" class="form-control" id="email" placeholder="pincode">
                </div>
              </div>
              <div class="form-group">
                <label for="phone" class="col-sm-2 control-label">Phone</label>
                <div class="col-sm-10">
                  <div class="input-group">
                      <span class="input-group-addon">+91</span>
                      <input type="text" maxlength="10" class="form-control" id="email" placeholder="+919645567834">
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
