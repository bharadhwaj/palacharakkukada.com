<%@page import="java.util.ArrayList"%>
<div class="row">
  <div class="col-sm-6 col-sm-offset-3">
    <p>
        <%
            if(request.getAttribute("errors") != null) {
            ArrayList<ArrayList<String>> errors = (ArrayList<ArrayList<String>>)request.getAttribute("errors");
        %>
      <ul class="list-unstyled" > 
        <% for(ArrayList<String> error: errors){%>
            <li>
                <div  class="alert alert-<%=error.get(0) %> alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" ><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button><p class="text-center"> <%=error.get(1) %> </p>
              </div>
            </li>
        <% } }%>
      </ul>
      
    </p>
  </div>
</div>
