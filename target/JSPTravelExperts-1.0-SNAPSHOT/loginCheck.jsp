<%@ page import="model.Customer" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.JSPTravelExperts.loginCheck" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String username=request.getParameter("user");
    String password=request.getParameter("pwd");
    //checks username and password
    Boolean check = loginCheck.checkUsernamePassword(username, password);
    if(check)
    {
        session.setAttribute("username",username); response.sendRedirect("index.jsp");
    }
    else {
        //need to send error message
        response.sendRedirect("error.jsp");
    }



%>

</body>
</html>