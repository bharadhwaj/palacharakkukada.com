<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<style type="text/css">
  ul.nav li.dropdown:hover > ul.dropdown-menu {
    display: block;    
  }
  @media (min-width: 979px) {
    ul.nav li.dropdown:hover > ul.dropdown-menu {
      display: block;
    }
  }
</style>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/palacharakkukada.com/index.jsp">
      <span class="glyphicon glyphicon-home" aria-hidden="true"> </span> palacharakkukada.com
      </a>
    </div>
      <%
          HashMap<String,ArrayList<String>> categories = (HashMap<String,ArrayList<String>>)session.getAttribute("categories");
      %>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
      <ul class="nav navbar-nav">
        <% if(categories.get("Grains") != null) {%>
        <li class="dropdown">
            
          <a href="search?search=Grains" class="dropdown-toggle"  role="button" aria-expanded="false">Grains <span class="caret"></span></a>
          <ul class="dropdown-menu open" role="menu">
              <% for(String item: categories.get("Grains")) {%>
                <li><a href="#"><%=item%></a></li>
              <% }%>
          </ul>
        </li>
        <% } %>
        <% if(categories.get("Beverages") != null) {%>
        <li class="dropdown">
          <a href="search?search=Beverages" class="dropdown-toggle" role="button" aria-expanded="false">Beverages <span class="caret"></span></a>
          <ul class="dropdown-menu open" role="menu">
            <% for(String item: categories.get("Beverages")) {%>
                <li><a href="#"><%=item%></a></li>
            <% }%>
          </ul>
        </li>
        <% } %>
        <% if(categories.get("Grocery") != null) {%>
        <li class="dropdown">
          <a href="search?search=Grocery" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Grocery <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <% for(String item: categories.get("Grocery")) {%>
                <li><a href="#"><%=item%></a></li>
            <% }%>
          </ul>
        </li>
        <% } %>
        <% if(categories.get("Stationary") != null) {%>
        <li class="dropdown">
          <a href="search?search=Stationary" class="dropdown-toggle" role="button" aria-expanded="false">Stationary <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <% for(String item: categories.get("Stationary")) {%>
                <li><a href="#"><%=item%></a></li>
            <% }%>
          </ul>
        </li>
        <% } %>
        <% if(categories.get("Others") != null) {%>
        <li class="dropdown">
          <a href="search?search=Others" class="dropdown-toggle" role="button" aria-expanded="false">Others <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <% for(String item: categories.get("Others")) {%>
                <li><a href="#"><%=item%></a></li>
            <% }%>
          </ul>
        </li>
        <% } %>
      </ul>
      <form action="search" method="get" class="navbar-form navbar-left" role="search">
       <div class="input-group">
          <input type="text" class="form-control" name="search" placeholder="Search for..." required>
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
              if((Integer)session.getAttribute("isAdmin") == 1) {
      %>
        
        <li>
          <a href="admin">
            <span class="glyphicon glyphicon-cog" aria-hidden="true"> </span> Admin 
          </a>
        </li>
      <% } %>
        <li>
          <a href="cart?step=0">
            <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"> </span> Cart 
          </a>
        </li>
        <li>
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
            <span class="glyphicon glyphicon-user" aria-hidden="true"> </span>
            Hi, <%=username %> <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/palacharakkukada.com/edituserdetails.jsp">Edit Profile</a></li>
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