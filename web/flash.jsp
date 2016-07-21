<%@page import="java.util.ArrayList"%>
<div class="row">
  <div class="col-sm-6 col-sm-offset-3">
    <p>
        <%
            if(session.getAttribute("messages") != null) {
            ArrayList<ArrayList<String>> messages = (ArrayList<ArrayList<String>>)session.getAttribute("messages");
            System.out.println(messages.get(0).get(0));
        %>
      <ul class="list-unstyled" > 
        <% for(ArrayList<String> message: messages){%>
            <li>
                <div  class="alert alert-<%=message.get(0) %> alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" ><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button><p class="text-center"> <%=message.get(1) %> </p>
              </div>
            </li>
        <% }
            session.removeAttribute("messages");
          }
        %>
      </ul>
      
    </p>
  </div>
</div>
