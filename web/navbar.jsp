<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/palacharakkukada.com/index.jsp">palacharakkukada.com</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form action="search" method="get" class="navbar-form navbar-left" role="search">
       <div class="input-group">
          <input type="text" class="form-control" name="search" placeholder="Search for...">
          <span class="input-group-btn">
            <button class="btn btn-default" type="submit">
              <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            </button>
          </span>
        </div>
      </form>
      <ul class="nav navbar-nav navbar-right">
      <%
          String username = "Login";
          if(session.getAttribute("username") != null) {
              username = (String) session.getAttribute("username");
      %>
        
        <li class="nav nav-pills"><a href="#"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>Cart <span class="badge">3</span></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Hi, <%=username %> <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Edit Profile</a></li>
            <li><a href="logout">Logout</a></li>
          </ul>
        </li>
      <% 
          } 
          else { 
      %>
      <li><a href="/palacharakkukada.com/login.jsp">Login</a></li>
      <% 
          } 
      %>
      </ul>
    </div>
  </div>
</nav>