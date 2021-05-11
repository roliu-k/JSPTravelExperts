<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="layout.jsp">
    <jsp:param name="title" value="Logout"/>
</jsp:include>

<body>
<div class="content-wrapper">
    <h1>Logout was successful.</h1>
</div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>

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
