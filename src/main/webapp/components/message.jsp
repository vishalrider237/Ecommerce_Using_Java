<%
    String message= (String) session.getAttribute("message");
    if (message!=null){

  //      out.println(message);
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong><%=message%></strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        session.removeAttribute("message");
    }
%>
<%
    String message1=(String) session.getAttribute("error_message");
    if (message1!=null){
%>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong><%=message1%></strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
        session.removeAttribute("error_message");
    }
%>