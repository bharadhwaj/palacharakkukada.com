<%@page import="java.util.ArrayList"%>
<div class="row">
  <div class="col-sm-6 col-sm-offset-3">
    <p>
        <%
            if(request.getAttribute("messages") != null) {
            ArrayList<ArrayList<String>> messages = (ArrayList<ArrayList<String>>)request.getAttribute("messages");
        %>
      <ul class="list-unstyled" > 
        <% for(ArrayList<String> message: messages){%>
            <li>
                <div  class="alert alert-<%=message.get(0) %> alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" ><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button><p class="text-center"> <%=message.get(1) %> </p>
              </div>
            </li>
        <% } }%>
      </ul>
      
    </p>
  </div>
</div>
