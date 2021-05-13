<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Logout"/>
</jsp:include>

<script>
    $(document).ready(function(){
        debugger
        sessionStorage.removeItem("token");
        sessionStorage.removeItem("customerID");
        sessionStorage.removeItem("username");
        sessionStorage.clear();
        window.location.replace("index.jsp");
    });
</script>
