<%@page import="java.util.ArrayList"%>
<style type="text/css">
.alert-fixed {
    position:fixed;  
    top:0px;
    left:0px;
    z-index:9999; 
    border-radius:0px;
}
</style>
<script type="text/javascript">
  setTimeout(function() {
    $("#alertPopup").fadeOut().empty();
  }, 3000);
</script>

<div id="alertPopup">
  <div class="col-md-6 col-md-offset-3 alert-fixed">
    <p>
        <%
            if(session.getAttribute("messages") != null) {
            ArrayList<ArrayList<String>> messages = (ArrayList<ArrayList<String>>)session.getAttribute("messages");
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
