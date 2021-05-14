<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Logout"/>
</jsp:include>

<%--The logout page is used to clear the token and other items that has stored in the session - Done by Julie--%>

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
